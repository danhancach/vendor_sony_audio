# DSEE-HX (stock A15 port)

Stock DSEE-HX/Ultimate tuning for Xperia 5 V (pdx237).

## Components

| Layer | Source | Notes |
|-------|--------|-------|
| Wrapper | `vendor/sony/sm8550-common` → `libsonydseehxwrapper.so` | PAL effect bridge |
| Engine | `vendor/sony/sm8550-common` → `libar-pal.so` | `dsee_set_parameters` in PAL |
| Params | this module → `/vendor/etc/dsx_param_file.bin`, `Drangepara*.bin` | codec-specific tuning |
| Routing | `frameworks/av` → `SonyDolbyAudioPolicy` | DSEE always wins when ON; `dolby/patches` 0002–0004 |
| Codec notify | `frameworks/av` → `SonyDseeCodecClient` | via `DSEE/patches` 0003 |
| UI toggle | `soundenhancement` → `dsee_hx_state` | Sound Enhancement app |

## Blobs

From `sony-stock-fw/extracted`:

```bash
./extract-from-stock.sh
# or: ./extract-from-stock.sh /path/to/extracted
```

## Framework patches

```bash
vendor/sony/audio/DSEE/patches/apply.sh
```

Routing invalidate / direct_pcm behavior is in `dolby/patches/frameworks/av/`.

## Verify

1. Settings → Sound → Sound quality → DSEE-HX ON
2. `adb shell dumpsys media.audio_policy | rg -i dsee`
3. Play MP3/AAC — logcat: `SonyDseeCodecClient`, PAL `update_codec_client_info`
4. `audio_flinger` output should use `direct_pcm` (not DAP path) when DSEE prioritized
