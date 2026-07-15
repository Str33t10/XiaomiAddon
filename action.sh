#!/bin/sh

if [ -z "$TMPDIR" ] && [ ! -z "$MAGISKTMP" ]; then
   pm path com.android.camera >/dev/null 2>&1 && {
      am start -n "com.android.camera/.CameraPreferenceActivity"
      exit 0
   }
fi
if [ -z "$MMRL" ] && [ -z "$KSU_NEXT" ] && { [ "$KSU" = "true" ] || [ "$APATCH" = "true" ]; }; then
   sleep 1
fi

# EOF
