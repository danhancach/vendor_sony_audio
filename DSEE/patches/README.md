# ROM patches (frameworks/av) for stock pdx237 DSEE-HX

Apply after `repo sync` of `frameworks/av`.

Mode routing (`dsee_hx_state`, `is_dsee_prioritized`, direct_pcm) lives in
`dolby/patches/frameworks/av/0002`–`0004` via `SonyDolbyAudioPolicy`.

## Apply

```bash
cd /home/tuan/android
vendor/sony/audio/DSEE/patches/apply.sh
```

## Patches

| Patch | What |
|-------|------|
| `0003-mediametrics-dsee-codec-client.patch` | `SonyDseeCodecClient` — notify PAL of active audio decoder (uid, mime, bitrate) |

Mirror: `.patchs/frameworks/av/0003-mediametrics-dsee-codec-client.patch`
