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

Patches `0001`–`0005` match git commit `95a61944a2` in `frameworks/av` (squashed Sony Dolby port).
