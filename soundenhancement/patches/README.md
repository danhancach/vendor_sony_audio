# Device-tree patches for stock pdx237 SoundEnhancement / Effect priority

Apply after `repo sync` of `device/sony/sm8550-common`.

Framework routing / somc sync: `dolby/patches/apply.sh` (`0014`–`0016`).

## Apply

```bash
cd /home/tuan/android
vendor/sony/audio/soundenhancement/patches/apply.sh
```

## Patches

| Patch | What |
|-------|------|
| `device/sony/sm8550-common/audio-app-white-list-33.patch` | Trim `audio_app_white_list.xml` to 33 apps (stock HAL / UI cap `0x21`) |

Mirror: `.patchs/device/sony/sm8550-common/audio-app-white-list-33.patch`
