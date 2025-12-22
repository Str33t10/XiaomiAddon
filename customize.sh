SKIPUNZIP=0
DEBUG=false

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
    ui_print "! unsupport mode"
    abort " "
fi

CAM_MODPATH="/data/adb/modules/xiaomicamera
if [ ! -d "$CAM_MODPATH" ]; then
    ui_print " "
    ui_print "! module not found"
    abort " "
fi

MODID=`grep_prop id $TMPDIR/module.prop`
NEW_MODID=.xiaomiaddon

# Cleanup left over
[ -d "/data/adb/modules/$NEW_MODID" ] && rm -rf "/data/adb/modules/$NEW_MODID"

if [ "$ACTION" = "false" ]; then
        rm -f "$MODPATH/action.sh"
        NEW_MODID="$MODID"
fi

cp "$MODPATH/module.prop" "$MODPATH/system.prop"

# EOF
