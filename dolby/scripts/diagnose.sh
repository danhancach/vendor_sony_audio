#!/usr/bin/env bash
# READ-ONLY Dolby runtime check (pdx237).
# Usage: scripts/diagnose.sh [ADB_SERIAL]
set -euo pipefail

ADB=(adb)
[[ -n "${1:-${ADB_SERIAL:-}}" ]] && ADB+=(-s "${1:-$ADB_SERIAL}")

run() { "${ADB[@]}" "$@"; }

echo "=== identity ==="
for p in \
  ro.product.vendor.model ro.product.vendor.device ro.product.vendor.name \
  ro.product.product.model ro.product.system_ext.model \
  persist.vendor.dolby.loglevel ro.vendor.dolby.dax.version; do
  printf '%-36s %s\n' "$p" "$(run shell getprop "$p" | tr -d '\r')"
done

echo "=== libswdap ==="
run shell sha256sum /vendor/lib64/soundfx/libswdap.so

echo "=== services / packages ==="
for s in dms-hal-2-0 vendor-dolby-media-c2-hal-1-0; do
  printf '%-36s %s\n' "init.svc.$s" "$(run shell getprop init.svc.$s | tr -d '\r')"
done
run shell pm path com.dolby.daxservice
run shell pm path com.dolby.daxappui2

echo "=== DlbGenClass2 (buffer) ==="
run logcat -d -b all 2>/dev/null | grep -E 'DlbGenClass2|Security Check' | tail -20 || true

echo "=== DAP ==="
run shell dumpsys media.audio_flinger | grep -A18 'name: DAP' | head -24
