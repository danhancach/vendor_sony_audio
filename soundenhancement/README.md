# Sound Enhancement (stock A15 UI)

Stock `com.sonyericsson.soundenhancement` priv-app for Sony audio mode UI:

- Settings → Sound → Sound quality (via `MANUFACTURER_APPLICATION_SETTING`)
- Dolby / DSEE-HX / equalizer / spatial toggles (`AudioManager.setParameters`)

## Blobs

From `sony-stock-fw/extracted` (firmware `67.2.A.3.178`):

```bash
./extract-from-stock.sh
```

## Depends on

- `vendor/sony/audio/dolby` — daxService, Dolby HAL, `libswdap`
- Framework patches in `dolby/patches/frameworks/av/` for mode routing

Settings hosts manufacturer tiles under `sound_quality_category` in
`packages/apps/Settings/res/xml/sound_settings.xml`.
