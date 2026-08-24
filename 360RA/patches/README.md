# ROM patches (frameworks/av) for stock pdx237 360RA

Apply after `repo sync` of `frameworks/av` and `vendor/sony/audio/dolby/patches/apply.sh`
(up to `0012`).

## Apply

```bash
cd /home/tuan/android
vendor/sony/audio/360RA/patches/apply.sh
```

## Patches

| Patch | What |
|-------|------|
| `0001-audiopolicy-360ra-routing-and-upmix.patch` | `Sony360RAudioPolicy`, `360ra_contents`, upmix pkg notify, deep-buffer routing |
| `0020-audio-360ra-native-deepbuffer-routing.patch` | Native 13ch mhm1/mha1 → deep-buffer mixer; block AOSP spatializer output |

Dolby/DSEE runtime priority and invalidate: `dolby/patches/frameworks/av/0013-*`.
Apply `0020` via this script or `dolby/patches/apply.sh` (not both on a clean tree).
