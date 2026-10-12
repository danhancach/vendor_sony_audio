# Sound Enhancement (stock A15 UI)

Stock `com.sonyericsson.soundenhancement` priv-app for Sony audio mode UI:

- Settings → Sound → Sound quality (via `MANUFACTURER_APPLICATION_SETTING`)
- Dolby / DSEE-HX / equalizer / spatial toggles (`AudioManager.setParameters`)
- Effect priority app list: requires stock `ExtendedAudioService` (`content://extaudio/info`)

## Blobs

From `.stock-fw/extracted` (firmware `67.2.A.3.178`):

```bash
./extract-from-stock.sh
```

`SoundEnhancement.apk` trong `proprietary/` đã được xử lý local (UI lag SelectAppActivity / AppsManager). **Không** ship smali/apk patch trong repo này — binary đã vá là SSOT. Sau khi extract lại từ stock sạch, cần áp lại chỉnh sửa APK thủ công trước khi commit blob.

## Depends on

- `vendor/sony/audio/dolby` — daxService, Dolby HAL, `libswdap`
- Framework mode routing / effect priority: hub `device/sony/pdx237/patchs/`
- Device whitelist `audio_app_white_list.xml` (33-app cap): đã apply trên `device/sony/sm8550-common` — không còn patch trong repo audio

ROM patches sau sync:

```bash
device/sony/pdx237/patchs/apply.sh
```

Settings hosts manufacturer tiles under `sound_quality_category` in
`packages/apps/Settings/res/xml/sound_settings.xml`.
