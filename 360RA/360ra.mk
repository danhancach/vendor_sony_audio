# Sony Xperia 5 V stock A15 360 Reality Audio (sm8550 / pdx237)

PRODUCT_SOONG_NAMESPACES += \
    vendor/sony/audio/360RA

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/sony/audio/360RA/configs/vintf/threesixty_framework_matrix.xml

BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/sony/audio/360RA/sepolicy/vendor

PRODUCT_PRIVATE_SEPOLICY_DIRS += \
    vendor/sony/audio/360RA/sepolicy/product

PRODUCT_COPY_FILES += \
    vendor/sony/audio/360RA/configs/sysconfig/config-jp.co.sony.threesixtyra.system.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/config-jp.co.sony.threesixtyra.system.xml

# Sony stock blobs replace AOSP at image assembly (same install paths).
# BUILD_BROKEN_DUP_RULES := true in pdx237 BoardConfig.mk.
PRODUCT_COPY_FILES += \
    vendor/sony/audio/360RA/proprietary/vendor/lib64/soundfx/libbundlewrapper.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libbundlewrapper.so \
    vendor/sony/audio/360RA/proprietary/vendor/lib64/libcodec2_soft_common.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_soft_common.so \
    vendor/sony/audio/360RA/proprietary/vendor/lib64/libsfplugin_ccodec_utils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libsfplugin_ccodec_utils.so

# Stock /data/vendor/360ra seed (upmix bins, tunedapp_list, headphone .ba, …).
360RA_DATA_SRC := vendor/sony/audio/360RA/configs/360ra-data
$(foreach f,$(wildcard $(360RA_DATA_SRC)/*),$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/360ra/$(notdir $(f))))

PRODUCT_PACKAGES += \
    init.sony-360ra-props.rc \
    alc.speaker.bin \
    libcodec2_soft_mha1dec \
    libcodec2_soft_mhm1dec \
    libthreesixty_ra_codec2_store \
    libupmix-lib \
    libtsrspatializer \
    libtsrupmix \
    android.hardware.media.c2@1.0-threesixty-ra-service \
    android.hardware.media.c2@1.0-threesixty-ra-service.rc \
    vendor.threesixty_ra.codec2.xml \
    android.hardware.media.c2@1.2-default-seccomp_policy \
    media_codecs_sony_c2_audio.xml \
    ThreeSixtyRASettings \
    ThreeSixtyRASystem \
    ThreeSixtyRASystem-pdx237-Overlay \
    com.sony.threesixtyra.audiofx \
    com.sony.360ra.xml \
    com.sony.threesixtyra.audiofx.xml \
    jp.co.sony.threesixtyra.system.xml \
    default-permissions-360ra.apps.xml

PRODUCT_VENDOR_PROPERTIES += \
    vendor.360ra.effect=1 \
    ro.audio.spatializer_enabled=true

PRODUCT_ODM_PROPERTIES += \
    vendor.sony_spatializer.suppress.dolby=true
