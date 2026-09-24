# Sony audio — pointer tới hub ROM patches

Bản vá **ROM** (frameworks/av, system/media, …) **không** giữ trong repo này.

| Mục | Path |
|-----|------|
| **Hub apply (SSOT)** | `device/sony/pdx237/patchs/apply.sh` |
| Tài liệu hub | `device/sony/pdx237/patchs/README.md` |
| Related commits | `device/sony/pdx237/patchs/RELATED.md` |
| Tip hub pdx237 | `68693e71f688` (`68693e71f688cc662ff0746c8f43857f150255ee`) — branch `check-dolby`; hub chỉ lớp A device-bound |

## Apply sau sync ROM

```bash
# Tu root AOSP — lop A (device-bound Sony/sm8550)
device/sony/pdx237/patchs/apply.sh
# Lop B ROM-only (EvoX/chung, offline): .patchs/apply-rom.sh
```

Redirect cũ (`dolby/patches/apply.sh`, `360RA/…`, `DSEE/…`) cũng gọi hub trên.

## Trong repo audio

- Proprietary Dolby / 360RA / DSEE / SoundEnhancement — giữ nguyên.
- SoundEnhancement whitelist device: `soundenhancement/patches/apply.sh` (device tree).
- Archive micro-patch cũ: offline `.patchs/archive/` — **không** commit lên GitHub.

## Related

Xem bảng đầy đủ trong `device/sony/pdx237/patchs/RELATED.md`.
