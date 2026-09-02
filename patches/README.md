# Sony audio patches (pdx237)

Patch gộp cho toàn bộ port Sony audio (Dolby, 360RA, DSEE), đặt ở đây thay vì trong từng thư mục con `dolby/` / `360RA/` / `DSEE/`.

## Apply

Từ root AOSP:

```bash
vendor/sony/audio/patches/apply.sh
```

Hoặc qua `.patchs` (symlink):

```bash
.patchs/sony-audio/apply.sh
```

## `frameworks/av`

| Patch | Nội dung |
|-------|----------|
| `0001-audioflinger-sony-port.patch` | DAP, DMS HIDL, pregain, invalidate, effect priority |
| `0002-audiopolicy-sony-port.patch` | Dolby, 360RA, DSEE routing |
| `0003-media-sony-port.patch` | audioserver HAL extn, DSEE codec client |

## Device tree

| Patch | Nội dung |
|-------|----------|
| `device/sony/sm8550-common/audio_effects-alarm-notification-listeners.patch` | Alarm/notification volume listener |

## Archive

Micro-patch cũ (0001–0023): `archive/frameworks/av/`

## Khác

- Whitelist 33 app: `soundenhancement/patches/apply.sh`
- `dolby/patches/apply.sh`, `360RA/patches/apply.sh`, `DSEE/patches/apply.sh` → redirect về script này
