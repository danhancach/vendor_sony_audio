# 360 Reality Audio (stock A15 port)

Stock blobs from `sony-stock-fw/extracted` via `./extract-from-stock.sh`.

## Components

- Codec2 HAL: `android.hardware.media.c2@1.0-threesixty-ra-service` (mha1/mhm1 decoders)
- Codec2 deps (stock vendor): `libcodec2_soft_common`, `libsfplugin_ccodec_utils` — required by mha1/mhm1 in vendor namespace
- Sound effects: spatializer (`libtsrspatializer`), upmix, Sony `libbundlewrapper` (+ bundle1–4 from sm8550-common)
- Config: seed `configs/360ra-data/` → `/vendor/etc/360ra/` → copied to `/data/vendor/360ra/` on boot (`init.sony-360ra.rc`)
- Apps: ThreeSixtyRASettings, ThreeSixtyRASystem (+ pdx237 overlay)
- Framework: `com.sony.threesixtyra.audiofx.jar`

Requires `TARGET_SUPPORTS_360RA := true` in device.mk (enables `init.sony-360ra.rc` + `audio_effects.xml` spatializer entries).

Framework: `FCC_LIMIT = FCC_13` in `system/media/audio/include/system/audio.h` — required for MPEG-H decoder output (`CHANNEL_OUT_13POINT0`, 13ch PCM). Without this, 360RA player apps fail with `AudioTrack: 13 > 12`.

Build note: Sony blobs that share paths with AOSP (`libbundlewrapper`, `libcodec2_soft_common`, `libsfplugin_ccodec_utils`) ship via `PRODUCT_COPY_FILES`; `BUILD_BROKEN_DUP_RULES := true` in pdx237 `BoardConfig.mk`.
