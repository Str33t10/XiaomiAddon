MODPATH=${0%/*}

pm path com.android.camera >/dev/null 2>&1 && {
   echo "- Launching..."
   am start -n "com.android.camera/.CameraPreferenceActivity" -e id "xiaomicamera"
   exit 0
}