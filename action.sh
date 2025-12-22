#!/bin/sh

if [ -z "$TMPDIR" ] && [ ! -z "$MAGISKTMP" ]; then
   pm path com.android.camera >/dev/null 2>&1 && {
      am start -n "com.android.camera/.CameraPreferenceActivity"
      exit 0
   }
fi
echo " "
sleep 1
exit 0

# EOF
