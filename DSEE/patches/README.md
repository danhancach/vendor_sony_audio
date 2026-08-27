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
| `0021-audio-dsee-direct-pcm-open.patch` | Open `direct_pcm` for DSEE when client requests PCM_FLOAT; skip 360RA DIRECT strip when DSEE routing active |

Mirror: `.patchs/frameworks/av/0003-mediametrics-dsee-codec-client.patch`, `.patchs/frameworks/av/0021-audio-dsee-direct-pcm-open.patch`

Routing stack (`dsee_hx_state`, `is_dsee_prioritized`): apply `dolby/patches/apply.sh` first (includes `0021`).
