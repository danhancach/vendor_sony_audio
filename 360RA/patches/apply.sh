#!/usr/bin/env bash
# Redirect: ROM patches hub = device/sony/pdx237/patchs/
echo "Dung device/sony/pdx237/patchs/apply.sh (hub ROM sau sync)." >&2
HUB="$(cd "$(dirname "$0")/../../../.." && pwd)/device/sony/pdx237/patchs/apply.sh"
# Tu vendor/sony/audio/dolby/patches -> ../../../../ = vendor? canh bao:
# dirname apply = .../dolby/patches; ../.. = audio; ../../.. = sony; ../../../.. = vendor
# Can len toi AOSP root. Tim apply hub:
ROOT="$(cd "$(dirname "$0")" && pwd)"
while [[ "$ROOT" != / ]]; do
  if [[ -x "$ROOT/device/sony/pdx237/patchs/apply.sh" ]]; then
    exec "$ROOT/device/sony/pdx237/patchs/apply.sh" "$@"
  fi
  if [[ -d "$ROOT/frameworks/av/.git" ]] || [[ -f "$ROOT/build/envsetup.sh" ]]; then
    break
  fi
  ROOT="$(cd "$ROOT/.." && pwd)"
done
if [[ -x "$ROOT/device/sony/pdx237/patchs/apply.sh" ]]; then
  exec "$ROOT/device/sony/pdx237/patchs/apply.sh" "$@"
fi
echo "ERROR: khong tim thay device/sony/pdx237/patchs/apply.sh" >&2
exit 1
