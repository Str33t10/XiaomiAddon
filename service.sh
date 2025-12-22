PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
MODPATH=${0%/*}

# Hide module from magisk manager
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

# Symlink magisk action.sh
if [ -f "$MODPATH/action.sh" ] && [ ! -e "/data/adb/modules/xiaomicamera/action.sh" ]; then
    ln -s "$MODPATH/action.sh" "/data/adb/modules/xiaomicamera/action.sh"
fi

# Symlink kernelsu web-ui
if [ ! -e "/data/adb/modules/xiaomicamera/webroot" ]; then
    ln -s "$MODPATH/webui" "/data/adb/modules/xiaomicamera/webroot"
fi

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

[ -f "$MODPATH/action.sh" ] && rm -rf "/data/adb/modules/xiaomiaddon"

# EOF
