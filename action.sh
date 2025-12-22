MODPATH=${0%/*}

if [ ! -z "$MAGISKTMP" ]; then
   pm path com.android.camera >/dev/null 2>&1 && {
      am start -n "com.android.camera/.CameraPreferenceActivity" -e id "xiaomicamera"
      exit 0
   }
fi
exit 0

#EOF
