#!/usr/bin/env bash
# Push Motorola rtwo A16 Dolby stack from vendor/dolby/proprietary via adb remount.
# Requires: userdebug, adb root, adb remount, setenforce 0 (recommended).
#
# Usage: ./push-test-adb.sh [--reboot]

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PROP="${ROOT}/proprietary"
REBOOT=false
[[ "${1:-}" == "--reboot" ]] && REBOOT=true

adb_cmd() { adb -s "${ADB_SERIAL:-}" "$@"; }

die() { echo "ERROR: $*" >&2; exit 1; }

[[ -d "$PROP/vendor" ]] || die "missing $PROP — run extract-from-moto-blob.sh first"

echo "==> adb root + remount"
adb_cmd root
adb_cmd remount

echo "==> SELinux permissive (userdebug)"
adb_cmd shell setenforce 0 || true

push_file() {
    local src="$1" dst="$2"
    [[ -f "$src" ]] || { echo "SKIP missing $src"; return 0; }
    adb_cmd shell "mkdir -p '$(dirname "$dst")'"
    adb_cmd push "$src" "$dst"
    echo "PUSH $dst"
}

echo "==> vendor blobs (lib64 + hw)"
mapfile -t VENDOR_FILES < <(find "$PROP/vendor/lib64" "$PROP/vendor/bin" -type f 2>/dev/null | sort)
for f in "${VENDOR_FILES[@]}"; do
    rel="${f#${PROP}/}"
    push_file "$f" "/vendor/${rel#vendor/}" || echo "WARN failed $f" >&2
done

echo "==> vendor configs"
for f in \
    vendor/etc/dolby/dax-default.xml \
    vendor/etc/dolby_vision.cfg \
    vendor/etc/media_codecs_dolby_audio.xml \
    vendor/etc/media_codecs_c2_dolby_vision.xml \
    vendor/etc/init/dms-service.rc \
    vendor/etc/init/vendor.dolby.media.c2@1.0-service.rc \
    vendor/etc/init/vendor.dolby.media.c2.dv@1.0-service.rc \
    vendor/etc/vintf/manifest/dms-service.xml \
    vendor/etc/vintf/manifest/vendor.dolby.media.c2.v1.0@1.0-service.xml \
    vendor/etc/vintf/manifest/vendor.dolby.vision.media.c2@1.0-service.xml
do
    push_file "$PROP/$f" "/vendor/${f#vendor/}"
done

echo "==> system_ext daxService"
push_file "$PROP/system_ext/priv-app/daxService/daxService.apk" \
    /system_ext/priv-app/daxService/daxService.apk
push_file "$PROP/system_ext/etc/permissions/com.dolby.daxservice.xml" \
    /system_ext/etc/permissions/com.dolby.daxservice.xml
adb_cmd shell rm -rf /system_ext/priv-app/daxService/oat

echo "==> system MotoDolbyDax3"
push_file "$PROP/system/app/MotoDolbyDax3/MotoDolbyDax3.apk" \
    /system/app/MotoDolbyDax3/MotoDolbyDax3.apk
push_file "$PROP/system/etc/permissions/com.motorola.dolby.dolbyui.dax3.features.xml" \
    /system/etc/permissions/com.motorola.dolby.dolbyui.dax3.features.xml
push_file "$PROP/system/etc/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml" \
    /system/etc/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml
adb_cmd shell mkdir -p /system/app/MotoDolbyDax3
adb_cmd shell rm -rf /system/app/MotoDolbyDax3/oat

echo "==> product default-permissions"
push_file "$PROP/product/etc/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml" \
    /product/etc/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml

echo "==> audio_effects (no libswvqe)"
AE="${ANDROID_BUILD_TOP:-/home/tuan/android}/device/sony/pdx237/audio/audio_effects.xml"
if [[ -f "$AE" ]]; then
    push_file "$AE" /vendor/etc/audio/sku_kalama/audio_effects.xml
fi

echo "==> remove old HIDL rc/manifest (init may still parse .rc.bak)"
adb_cmd shell '
rm -f /vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc \
      /vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc.bak \
      /vendor/etc/vintf/manifest/vendor.dolby.hardware.dms.xml \
      /vendor/etc/vintf/manifest/vendor.dolby.hardware.dms.xml.bak 2>/dev/null || true
'

echo "==> chmod binaries"
adb_cmd shell 'chmod 755 /vendor/bin/hw/vendor.dolby.dms.service \
    /vendor/bin/hw/vendor.dolby.media.c2@1.0-service \
    /vendor/bin/hw/dolbycodec2 2>/dev/null || true'

adb_cmd shell rm -f /data/local/tmp/_dolby_push

if $REBOOT; then
    echo "==> reboot"
    adb_cmd reboot
    exit 0
fi

echo "==> restart HAL (no reboot)"
adb_cmd shell 'stop dms-hal 2>/dev/null; stop vendor-dolby-media-c2-hal-1-0 2>/dev/null; \
    killall vendor.dolby.hardware.dms@2.0-service 2>/dev/null; \
    killall vendor.dolby.dms.service 2>/dev/null; true'
sleep 1
adb_cmd shell 'start dms-hal 2>/dev/null; start vendor-dolby-media-c2-hal-1-0 2>/dev/null; true'
sleep 2

echo "==> status"
adb_cmd shell getprop init.svc.dms-hal
adb_cmd shell 'ls -la /vendor/bin/hw/vendor.dolby* 2>/dev/null'
adb_cmd shell 'pidof vendor.dolby.dms.service vendor.dolby.hardware.dms@2.0-service 2>/dev/null || true'

echo "Done. Nếu dms-hal không running → adb reboot rồi kiểm tra lại."
echo "Mở UI: adb shell am start -n com.motorola.dolby.dolbyui/.MainActivity"
