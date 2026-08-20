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

for n in 0001 0002 0003 0004 0005 0010; do
    apply_one "$HERE/frameworks/av/${n}"*.patch
done
