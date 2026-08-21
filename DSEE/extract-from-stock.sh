#!/usr/bin/env bash
# Copy stock A15 DSEE-HX param blobs into proprietary/.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/../../.." && pwd)"
SRC="${1:-$ROOT/sony-stock-fw/extracted}"
DST="$HERE/proprietary"
LIST="$HERE/proprietary-files.txt"

if [[ ! -d "$SRC/vendor" ]]; then
    echo "ERROR: stock extract not found: $SRC" >&2
    exit 1
fi

missing=0
copied=0
while IFS= read -r rel; do
    [[ -z "$rel" || "$rel" == \#* ]] && continue
    src="$SRC/$rel"
    dest="$DST/$rel"
    if [[ ! -f "$src" ]]; then
        echo "MISSING: $rel" >&2
        missing=$((missing + 1))
        continue
    fi
    mkdir -p "$(dirname "$dest")"
    cp -a "$src" "$dest"
    echo "OK $rel"
    copied=$((copied + 1))
done < "$LIST"

if [[ "$missing" -gt 0 ]]; then
    echo "FAILED: $missing file(s) missing" >&2
    exit 1
fi

echo "Done: $copied files → $DST"
