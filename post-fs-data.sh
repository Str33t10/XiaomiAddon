MODPATH=${0%/*}

while [ -z "$(ls -A /data/adb/modules/)" ]; do
    sleep 1
done

if [ ! -d "/data/adb/modules/xiaomicamera" ] || [ -f "/data/adb/modules/xiaomicamera/remove" ]; then
    if [ -f "$MODPATH/action.sh" ]; then
        [ -d "/data/adb/modules/xiaomiaddon" ] && rm -rf "/data/adb/modules/xiaomiaddon"
        cp -rf "$MODPATH" "/data/adb/modules/xiaomiaddon"
        touch "/data/adb/modules/xiaomiaddon/remove"
    else
        mv -f "$MODPATH/module.prop.bak" "$MODPATH/module.prop"
        touch "$MODPATH/remove"
    fi
fi

[ -L "/data/adb/modules/xiaomicamera/action.sh" ] && rm -f "/data/adb/modules/xiaomicamera/action.sh"
[ -L "/data/adb/modules/xiaomicamera/webroot" ] && rm -f "/data/adb/modules/xiaomicamera/webroot"

# EOF