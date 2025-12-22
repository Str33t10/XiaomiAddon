SKIPUNZIP=0
DEBUG=false

if [ ! -d "/data/adb/modules/xiaomicamera" ]; then
    ui_print " "
    ui_print "! Xiaomi module not found"
    abort " "
fi

ui_print " "
if [ "$APATCH" ]; then
    ui_print "- APatch: $APATCH_VER│$APATCH_VER_CODE"
    ACTION=false
elif [ "$KSU" ]; then
    if [ "$KSU_NEXT" ]; then
        ui_print "- KernelSU Next: $KSU_KERNEL_VER_CODE│$KSU_VER_CODE"
    else
        ui_print "- KernelSU: $KSU_KERNEL_VER_CODE│$KSU_VER_CODE"
    fi
    ACTION=false
elif [ "$MAGISK_VER_CODE" ]; then
    ui_print "- Magisk: $MAGISK_VER│$MAGISK_VER_CODE"
else
    ui_print " "
    ui_print "! Manager is not supported"
    abort " "
fi

# Cleanup left over
MODID=`grep_prop id $TMPDIR/module.prop`
NEW_MODID=".xiaomiaddon"
[ -d "/data/adb/modules/$NEW_MODID" ] && rm -rf "/data/adb/modules/$NEW_MODID"
if [ "$ACTION" = "false" ]; then
        rm -f "$MODPATH/action.sh"
        NEW_MODID="$MODID"
fi
cp "$TMPDIR/module.prop" "$MODPATH/module.prop.bak"

sleep 1

ui_print "- Successfully completed"
ui_print " "

# EOF