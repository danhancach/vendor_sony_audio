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

Dolby/DSEE runtime priority and invalidate: `dolby/patches/frameworks/av/0013-*`.
