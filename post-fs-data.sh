MODPATH=${0%/*}
CAM_MODPATH="/data/adb/modules/xiaomicamera"

while [ -z "$(ls -A /data/adb/modules/)" ]; do
    sleep 1
done

if [ ! -d "$CAM_MODPATH" ] || [ -f "$CAM_MODPATH/remove" ]; then
    if [ -f "$MODPATH/action.sh" ]; then
        [ -d "/data/adb/modules/xiaomiaddon" ] && rm -rf "/data/adb/modules/xiaomiaddon"
        cp -rf "$MODPATH" "/data/adb/modules/xiaomiaddon"
        touch "/data/adb/modules/xiaomiaddon/remove"
    else
        mv -f "$MODPATH/config.sh" "$MODPATH/module.prop"
        touch "$MODPATH/remove"
    fi
fi

[ -L "$CAM_MODPATH/webroot" ] && rm -f "$CAM_MODPATH/webroot"
[ -L "$CAM_MODPATH/action.sh" ] && rm -f "$CAM_MODPATH/action.sh"