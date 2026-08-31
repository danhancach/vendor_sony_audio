#!/usr/bin/env bash
# Apply Dolby frameworks/av patches. Idempotent: skip if already applied.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE"
while [[ ! -d "$ROOT/frameworks/av" && "$ROOT" != / ]]; do
    ROOT="$(cd "$ROOT/.." && pwd)"
done
AV="$ROOT/frameworks/av"

if [[ ! -d "$AV/.git" && ! -d "$AV" ]]; then
    echo "ERROR: frameworks/av not found: $AV" >&2
    exit 1
fi

apply_one() {
    local patch="$1"
    if git -C "$AV" apply --check --reverse "$patch" >/dev/null 2>&1; then
        echo "already applied: $(basename "$patch")"
        return 0
    fi
    git -C "$AV" apply "$patch"
    echo "applied: $(basename "$patch")"
}

for n in 0001 0002 0003 0004 0005 0010 0011 0012 0013 0014 0015 0016; do
    apply_one "$HERE/frameworks/av/${n}"*.patch
done
apply_one "$HERE/frameworks/av/0020-audio-360ra-native-deepbuffer-routing.patch"
apply_one "$HERE/frameworks/av/0021-audio-dsee-direct-pcm-open.patch"
apply_one "$HERE/frameworks/av/0022-audio-dap-pregain-defer-mutex-fix.patch"
apply_one "$HERE/frameworks/av/0023-audio-dap-pregain-sonification.patch"

DT="$ROOT/device/sony/sm8550-common"
if [[ -d "$DT" ]]; then
    apply_dt() {
        local patch="$1"
        if git -C "$DT" apply --check --reverse "$patch" >/dev/null 2>&1; then
            echo "already applied: $(basename "$patch") (device tree)"
            return 0
        fi
        git -C "$DT" apply "$patch"
        echo "applied: $(basename "$patch") (device tree)"
    }
    apply_dt "$HERE/device/sony/sm8550-common/audio_effects-alarm-notification-listeners.patch"
fi
