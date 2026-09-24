# Sony Xperia 5 V stock A15 Dolby (sm8550 / pdx237)

PRODUCT_SOONG_NAMESPACES += \
    vendor/sony/audio/dolby \
    vendor/sony/audio/dolby/hidl

AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# Fragments via prebuilt_etc_xml only — do not also set DEVICE_MANIFEST_FILE.
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/sony/audio/dolby/configs/vintf/dolby_framework_matrix.xml

BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/sony/audio/dolby/sepolicy/vendor

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    vendor/sony/audio/dolby/sepolicy/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    vendor/sony/audio/dolby/sepolicy/private

# sm8550-common gates this XML behind TARGET_SUPPORTS_360RA; pdx237 is false.
PRODUCT_COPY_FILES += \
    device/sony/sm8550-common/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/audio_effects.xml

PRODUCT_PACKAGES += \
    daxService \
    DolbySound \
    com.dolby.daxservice.xml \
    dax-default.xml \
    media_codecs_dolby_audio.xml \
    vendor.dolby.hardware.dms@2.0 \
    vendor.dolby.hardware.dms@2.0_vendor \
    vendor.dolby.hardware.dms@2.0-impl \
    vendor.dolby.hardware.dms@2.0-service \
    vendor.dolby.hardware.dms@2.0-service.rc \
    vendor.dolby.hardware.dms.xml \
    vendor.dolby.media.c2@1.0-service \
    vendor.dolby.media.c2@1.0-service.rc \
    vendor.dolby.media.c2@1.0-service.xml \
    libmmparserextractor \
    libavenhancements \
    libXtcApi \
    libaudiokeymgr \
    libaudiosnpewrapper \
    libaudiosnpewrapper_context \
    libcodec2_soft_ac4dec \
    libcodec2_soft_ddpdec \
    libcodec2_soft_dolby \
    libcodec2_store_dolby \
    libdapparamstorage \
    libdeccfg \
    libdlbdsservice \
    libdlbpreg \
    libiVptApi \
    libiVptHkiDec \
    libiVptLibC \
    liboem_specific \
    librebuffering \
    libtsrspkenhance \
    libznr \
    libdlbvol \
    libswdap \
    libswgamedap \
    libswvqe \
    libdnnrwrapper \
    libznrwrapper

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.dolby.ds2.enabled=false \
    ro.product.vendor.model=Pdx237 \
    vendor.audio.invalidate_sleep_before=100000 \
    vendor.audio.invalidate_sleep_dsee_on=50000 \
    vendor.audio.invalidate_sleep_after=0
