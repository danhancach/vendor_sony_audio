# ROM patches (frameworks/av) for stock pdx237 Dolby

Apply after `repo sync` of `frameworks/av`.

Not included (other ROM work, already in `.patchs/`):
- `media/audioserver/main_audioserver.cpp` (`load-libaudiohalvendorextn`)
- `audiopolicy/enginedefault` camcorder mic

## Apply

```bash
cd /home/tuan/android
vendor/sony/audio/dolby/patches/apply.sh
```

## Patches

| Patch | What |
|-------|------|
| `0001-audioflinger-effect-dap-controller.patch` | `EffectDapController`, orphan DAP hook, skipEffectProcess |
| `0002-audiopolicy-sony-dolby.patch` | Block offload/direct when Dolby on; session-0 DAP on mixer |
| `0003-audio-routing-invalidate-on-dolby-off.patch` | Full music invalidate when Dolby turns off |
| `0004-audiopolicy-dolby-deep-buffer-speaker-balance.patch` | Keep DEEP_BUFFER speaker path when Dolby ON |
| `0005-audioflinger-sync-dolby-hal-state.patch` | Sync `dle_ds_state` HAL → `EffectDapController` |
| `0010-audioflinger-dms-hidl-client.patch` | DMS HIDL client, SET_BYPASS, DAP volume resync |
| `0011-audioflinger-dms-no-set-param-forward.patch` | Do not relay DMS blobs via EFFECT_CMD_SET_PARAM |
| `0012-audioflinger-pregain-prep.patch` | Stock pregain prep: OFFLOAD + DAP cycle on Music Listener attach |
| `0013-audio-dolby-dsee-runtime-priority.patch` | Dolby > 360RA > DSEE routing invalidate, stock routing watcher, MixerThread invalid cleanup |
| `0014-audio-sony-effect-priority-routing.patch` | Stock effect-priority arbitration (360/DSEE vs Dolby), somc app lists in `EffectDapController` |
| `0015-audio-dolby-toggle-no-invalidate.patch` | Invalidate music only on `dsee_hx_state` route change, not Dolby toggle |
| `0016-audio-effect-priority-preset-and-defer.patch` | HAL preset XML fallback (`SonyEffectPriorityApps`), defer invalidate on somc sync (fix add-app deadlock) |
| `0020-audio-360ra-native-deepbuffer-routing.patch` | Route native 360RA 13ch via deep-buffer mixer (stock), block AOSP spatializer (`libtsrspatializer` stereo fail) |
| `0021-audio-dsee-direct-pcm-open.patch` | Open `direct_pcm` for DSEE when client requests PCM_FLOAT; skip 360RA DIRECT strip when DSEE routing active |

Alternative single-shot after `0013`: `0018-audio-effect-priority-verified.patch` (do not combine with `0014`–`0016`). Apply `0020`–`0021` after either stack. Do **not** apply deprecated `0019` (spatializer routing caused silent playback).

Effect priority whitelist (33 apps): `soundenhancement/patches/apply.sh`.

Patches `0001`–`0005` match git commit `95a61944a2` in `frameworks/av` (squashed Sony Dolby port).
360RA routing hooks: `360RA/patches/frameworks/av/0001-*` (apply before `0013`).
