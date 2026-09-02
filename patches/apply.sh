#!/usr/bin/env bash
# Sony audio port for pdx237 — consolidated patches (Dolby + 360RA + DSEE).
# Patches live here, not under dolby/360RA/DSEE subfolders.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE"
while [[ "$ROOT" != / ]]; do
    if [[ -d "$ROOT/frameworks/av/.git" ]]; then
        break
    fi
    ROOT="$(cd "$ROOT/.." && pwd)"
done
AV="$ROOT/frameworks/av"

if [[ ! -d "$AV/.git" ]]; then
    echo "ERROR: frameworks/av git repo not found (stopped at $ROOT)" >&2
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

for p in \
    0001-audioflinger-sony-port.patch \
    0002-audiopolicy-sony-port.patch \
    0003-media-sony-port.patch; do
    apply_one "$HERE/frameworks/av/$p"
done

DT="$ROOT/device/sony/sm8550-common"
if [[ -d "$DT/.git" ]]; then
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
