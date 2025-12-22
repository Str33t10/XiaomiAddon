PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH

MODPATH=${0%/*}
CAM_MODPATH="/data/adb/modules/xiaomicamera"
ADD_MODPATH="/data/adb/modules/.xiaomiaddon"

# Hide module from magisk manager
if [ -f "$MODPATH/action.sh" ]; then
    if [ "$MODPATH" != "$ADD_MODPATH" ]; then
        rm -rf "$ADD_MODPATH"
        mkdir -p "$ADD_MODPATH"
        busybox chcon --reference="$MODPATH" "$ADD_MODPATH"
        cp -af "$MODPATH/." "$ADD_MODPATH/"
    fi
    MODPATH="$ADD_MODPATH"
else
    [ -d "$ADD_MODPATH" ] && rm -rf "$ADD_MODPATH"
fi

# Hide module from other manager
rm -f "$MODPATH/module.prop"

# Symlink leica preference
if [ -f "$MODPATH/action.sh" ] && [ ! -e "$CAM_MODPATH/action.sh" ]; then
    ln -s "$MODPATH/action.sh" "$CAM_MODPATH/action.sh"
fi
if [ ! -e "$CAM_MODPATH/webroot" ]; then
    ln -s "$MODPATH/webui" "$CAM_MODPATH/webroot"
fi

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

[ -f "$MODPATH/action.sh" ] && rm -rf "/data/adb/modules/xiaomiaddon"

#EOF
