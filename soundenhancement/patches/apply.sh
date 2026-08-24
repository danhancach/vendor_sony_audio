#!/usr/bin/env bash
# Apply SoundEnhancement device-tree patches. Idempotent: skip if already applied.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE"
while [[ ! -d "$ROOT/device/sony/sm8550-common" && "$ROOT" != / ]]; do
    ROOT="$(cd "$ROOT/.." && pwd)"
done
DT="$ROOT/device/sony/sm8550-common"

if [[ ! -d "$DT" ]]; then
    echo "ERROR: device/sony/sm8550-common not found: $DT" >&2
    exit 1
fi

apply_one() {
    local patch="$1"
    if git -C "$DT" apply --check --reverse "$patch" >/dev/null 2>&1; then
        echo "already applied: $(basename "$patch")"
        return 0
    fi
    git -C "$DT" apply "$patch"
    echo "applied: $(basename "$patch")"
}

apply_one "$HERE/device/sony/sm8550-common/audio-app-white-list-33.patch"
