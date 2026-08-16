#!/usr/bin/env bash
# Copy Dolby blobs from local Motorola rtwo dump into vendor/dolby/proprietary.
# Source: ~/android/sony-stock-fw/moto-blob/rtwo (A16 user build)

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
MOTO="${MOTO_BLOB_ROOT:-/home/tuan/android/sony-stock-fw/moto-blob/rtwo}"
PROP="${ROOT}/proprietary"

if [[ ! -d "$MOTO/vendor" ]]; then
    echo "Missing moto dump at $MOTO" >&2
    exit 1
fi

copy_rel() {
    local rel="$1"
  local src dst
  case "$rel" in
    system/*)
      src="${MOTO}/system/system/${rel#system/}"
      ;;
    *)
      src="${MOTO}/${rel}"
      ;;
  esac
  dst="${PROP}/${rel}"
  if [[ ! -f "$src" ]]; then
    echo "SKIP missing: $rel" >&2
    return 0
  fi
  mkdir -p "$(dirname "$dst")"
  cp -f "$src" "$dst"
  echo "COPY $rel"
}

FILES=(
  system_ext/priv-app/daxService/daxService.apk
  system_ext/etc/permissions/com.dolby.daxservice.xml
  system/app/MotoDolbyDax3/MotoDolbyDax3.apk
  system/etc/permissions/com.motorola.dolby.dolbyui.dax3.features.xml
  system/etc/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml
  product/etc/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml
  vendor/bin/hw/vendor.dolby.dms.service
  vendor/bin/hw/vendor.dolby.media.c2@1.0-service
  vendor/bin/hw/dolbycodec2
  vendor/etc/dolby/dax-default.xml
  vendor/etc/dolby_vision.cfg
  vendor/etc/media_codecs_dolby_audio.xml
  vendor/etc/media_codecs_c2_dolby_vision.xml
  vendor/etc/init/dms-service.rc
  vendor/etc/init/vendor.dolby.media.c2@1.0-service.rc
  vendor/etc/init/vendor.dolby.media.c2.dv@1.0-service.rc
  vendor/etc/vintf/manifest/dms-service.xml
  vendor/etc/vintf/manifest/vendor.dolby.media.c2.v1.0@1.0-service.xml
  vendor/etc/vintf/manifest/vendor.dolby.vision.media.c2@1.0-service.xml
  vendor/lib/libdapparamstorage.so
  vendor/lib/libdlbpreg.so
  vendor/lib/libdmshal.so
  vendor/lib/libdolbyottcameracontrol.so
  vendor/lib/libdolbyvision.so
  vendor/lib/c2.dolby.client.so
  vendor/lib/c2.dolby.decoder.so
  vendor/lib/c2.dolby.decoder.secure.so
  vendor/lib/c2.dolby.egl.so
  vendor/lib/c2.dolby.store.so
  vendor/lib/soundfx/libdlbvol.so
  vendor/lib/soundfx/libswdap.so
  vendor/lib/soundfx/libswgamedap.so
  vendor/lib/vendor.dolby.dms-V1-ndk.so
  vendor/lib/vendor.dolby.hardware.dms@2.0.so
  vendor/lib/vendor.dolby.hardware.dms@2.1.so
  vendor/lib64/libdapparamstorage.so
  vendor/lib64/libdeccfg.so
  vendor/lib64/libdlbdsservice.so
  vendor/lib64/libdlbpreg.so
  vendor/lib64/libdmshal.so
  vendor/lib64/libdolbyottcameracontrol.so
  vendor/lib64/libdolbyvision.so
  vendor/lib64/libcodec2_store_dolby.so
  vendor/lib64/c2.dolby.client.so
  vendor/lib64/c2.dolby.decoder.so
  vendor/lib64/c2.dolby.decoder.secure.so
  vendor/lib64/c2.dolby.egl.so
  vendor/lib64/c2.dolby.store.so
  vendor/lib64/soundfx/libdlbvol.so
  vendor/lib64/soundfx/libswdap.so
  vendor/lib64/soundfx/libswgamedap.so
  vendor/lib64/vendor.dolby.dms-V1-ndk.so
  vendor/lib64/vendor.dolby.hardware.dms@2.0.so
  vendor/lib64/vendor.dolby.hardware.dms@2.1.so
)

rm -rf "$PROP"
mkdir -p "$PROP"

for f in "${FILES[@]}"; do
  copy_rel "$f"
done

echo "Done. $(find "$PROP" -type f | wc -l) files in proprietary/"
