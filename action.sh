MODPATH=${0%/*}

am start -n "com.android.camera/.CameraPreferenceActivity" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    exit 0
else
    echo "! Xiaomi Camera not found"
fi