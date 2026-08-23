#!/usr/bin/env bash
# Copy stock A15 360RA blobs into proprietary/. Does not touch configs/.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/../../../.." && pwd)"
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

# Runtime tuning seed (stock /data/vendor/360ra snapshot — not in partition extract).
DATA_SRC="${DATA_SRC:-$ROOT/sony-stock-fw/live-pull-20260817T123011Z/needs-root/staged-from-device/360ra}"
DATA_DST="$HERE/configs/360ra-data"
if [[ -d "$DATA_SRC" ]]; then
    mkdir -p "$DATA_DST"
    cp -a "$DATA_SRC/." "$DATA_DST/"
    echo "OK 360ra-data ($(find "$DATA_DST" -maxdepth 1 -type f | wc -l) files) → $DATA_DST"
else
    echo "SKIP 360ra-data: $DATA_SRC not found (run stock live-pull first)" >&2
fi
