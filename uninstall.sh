rm -rf "/data/adb/modules/.xiaomiaddon"

# Remove residue.
if [ -d "/data/adb/modules/xiaomicamera" ]; then
    [ -L "/data/adb/modules/xiaomicamera/action.sh" ] && rm -f "/data/adb/modules/xiaomicamera/action.sh"
    [ -L "/data/adb/modules/xiaomicamera/webroot" ] && rm -f "/data/adb/modules/xiaomicamera/webroot"
fi

# EOF
