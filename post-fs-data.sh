MODPATH=${0%/*}

CAM_MODPATH="/data/adb/modules/xiaomicamera"
if [ ! -d "$CAM_MODPATH" ] || [ -f "$CAM_MODPATH/remove" ]; then
    if [ -f "$MODPATH/action.sh" ]; then
        [ -d "/data/adb/modules/xiaomiaddon" ] && rm -rf "/data/adb/modules/xiaomiaddon"
        cp -rf "$MODPATH" "/data/adb/modules/xiaomiaddon"
        touch "/data/adb/modules/xiaomiaddon/remove"
    else
        mv -f "$MODPATH/system.prop" "$MODPATH/module.prop"
        touch "$MODPATH/remove"
    fi
fi

while [ -z "$(ls -A /data/adb/modules/)" ]; do
    sleep 1
done

[ -L "$CAM_MODPATH/action.sh" ] && rm -f "$CAM_MODPATH/action.sh"
[ -L "$CAM_MODPATH/webroot" ] && rm -f "$CAM_MODPATH/webroot"

# EOF
