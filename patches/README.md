# ROM patches (frameworks/av) for stock pdx237 Dolby

Generated from the current AOSP 17 tree. Apply after `repo sync` of `frameworks/av`.

Not included (other ROM work, already in `.patchs/`):
- `media/audioserver/main_audioserver.cpp` (`load-libaudiohalvendorextn`)
- `audiopolicy/enginedefault` camcorder mic

## Apply

```bash
cd /home/tuan/android
vendor/sony/dolby/patches/apply.sh
```

Or:

```bash
cd frameworks/av
git apply ../vendor/sony/dolby/patches/frameworks/av/0001-audioflinger-effect-dap-controller.patch
git apply ../vendor/sony/dolby/patches/frameworks/av/0002-audiopolicy-sony-dolby.patch
```

## Files

| Patch | What |
|-------|------|
| `0001-audioflinger-effect-dap-controller.patch` | `EffectDapController`, orphan DAP hook, skipEffectProcess, SET_BYPASS |
| `0002-audiopolicy-sony-dolby.patch` | Block offload/direct/deep-buffer when Dolby on; keep music on mixer with session-0 DAP |
