#!/usr/bin/env bash
# Deprecated: patches moved to vendor/sony/audio/patches/
exec "$(cd "$(dirname "$0")/../.." && pwd)/patches/apply.sh"
