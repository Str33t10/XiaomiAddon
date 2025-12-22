MODPATH=${0%/*}

# Hide module from magisk manager
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
ADDON_MODPATH="/data/adb/modules/.xiaomiaddon"
if [ -f "$MODPATH/action.sh" ]; then
    if [ "$MODPATH" != "$ADDON_MODPATH" ]; then
        rm -rf "$ADDON_MODPATH"
        mkdir -p "$ADDON_MODPATH"
        busybox chcon --reference="$MODPATH" "$ADDON_MODPATH"
        cp -af "$MODPATH/." "$ADDON_MODPATH/"
    fi
    MODPATH="$ADDON_MODPATH"
else
    [ -d "$ADDON_MODPATH" ] && rm -rf "$ADDON_MODPATH"
fi

# Hide module from other manager
rm -f "$MODPATH/module.prop"

CAM_MODPATH="/data/adb/modules/xiaomicamera"

# Symlink magisk action.sh
if [ -f "$MODPATH/action.sh" ] && [ ! -e "$CAM_MODPATH/action.sh" ]; then
    ln -s "$MODPATH/action.sh" "$CAM_MODPATH/action.sh"
fi

# Symlink kernelsu web-ui
if [ ! -e "$CAM_MODPATH/webroot" ]; then
    ln -s "$MODPATH/webui" "$CAM_MODPATH/webroot"
fi

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

[ -f "$MODPATH/action.sh" ] && rm -rf "/data/adb/modules/xiaomiaddon"

# EOF
