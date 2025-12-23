MODPATH=${0%/*}
CAM_MODPATH="/data/adb/modules/xiaomicamera"

# Remove residue.
rm -rf "/data/adb/modules/.xiaomiaddon"
if [ -d "$CAM_MODPATH" ]; then
    [ -L "$CAM_MODPATH/webroot" ] && rm -f "$CAM_MODPATH/webroot"
    [ -L "$CAM_MODPATH/action.sh" ] && rm -f "$CAM_MODPATH/action.sh"
fi