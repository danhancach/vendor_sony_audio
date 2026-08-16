# Dolby Motorola rtwo A16 (sm8550) — blobs via Soong, configs via COPY_FILES

PRODUCT_SOONG_NAMESPACES += \
    vendor/dolby

AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

PRODUCT_COPY_FILES += \
    vendor/dolby/proprietary/system_ext/etc/permissions/com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.dolby.daxservice.xml \
    vendor/dolby/proprietary/system/etc/permissions/com.motorola.dolby.dolbyui.dax3.features.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.motorola.dolby.dolbyui.dax3.features.xml \
    vendor/dolby/proprietary/system/etc/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml \
    vendor/dolby/proprietary/product/etc/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml \
    vendor/dolby/proprietary/vendor/etc/init/dms-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/dms-service.rc \
    vendor/dolby/proprietary/vendor/etc/init/vendor.dolby.media.c2@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.media.c2@1.0-service.rc \
    vendor/dolby/proprietary/vendor/etc/init/vendor.dolby.media.c2.dv@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.media.c2.dv@1.0-service.rc \
    vendor/dolby/proprietary/vendor/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    vendor/dolby/proprietary/vendor/etc/dolby_vision.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/dolby_vision.cfg \
    vendor/dolby/proprietary/vendor/etc/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    vendor/dolby/proprietary/vendor/etc/media_codecs_c2_dolby_vision.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_dolby_vision.xml

PRODUCT_PACKAGES += \
    daxService \
    MotoDolbyDax3 \
    dms-service.xml \
    vendor.dolby.media.c2.v1.0@1.0-service.xml \
    vendor.dolby.vision.media.c2@1.0-service.xml \
    vendor.dolby.dms.service \
    vendor.dolby.media.c2@1.0-service \
    dolbycodec2 \
    vendor.dolby.hardware.dms@2.0_vendor \
    vendor.dolby.hardware.dms@2.1_vendor \
    vendor.dolby.dms-V1-ndk \
    libdapparamstorage \
    libdeccfg \
    libdlbdsservice \
    libdlbpreg \
    libdmshal \
    libdolbyottcameracontrol \
    libdolbyvision \
    libcodec2_store_dolby \
    c2.dolby.client \
    c2.dolby.decoder \
    c2.dolby.decoder.secure \
    c2.dolby.egl \
    c2.dolby.store \
    libdlbvol \
    libswdap \
    libswgamedap
