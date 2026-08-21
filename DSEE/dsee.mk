# Sony Xperia 5 V stock A15 DSEE-HX (sm8550 / pdx237)
#
# libsonydseehxwrapper + PAL engine ship from vendor/sony/sm8550-common.
# This module installs codec-specific tuning blobs consumed by PAL dsee_set_parameters.

PRODUCT_COPY_FILES += \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/dsx_param_file.bin:$(TARGET_COPY_OUT_VENDOR)/etc/dsx_param_file.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaAAC64.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaAAC64.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaAAC128.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaAAC128.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaAAC256.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaAAC256.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaMP3_128.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaMP3_128.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaMP3_160.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaMP3_160.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaMP3_192.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaMP3_192.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaPCM441.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaPCM441.bin \
    vendor/sony/audio/DSEE/proprietary/vendor/etc/DrangeparaPCM48.bin:$(TARGET_COPY_OUT_VENDOR)/etc/DrangeparaPCM48.bin
