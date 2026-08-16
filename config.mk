# Automatically generated file. DO NOT MODIFY

$(call inherit-product, vendor/dolby/dolby.mk)

# VINTF manifests (AIDL DMS + Codec2 Dolby Vision)
DEVICE_MANIFEST_FILE += \
    vendor/dolby/proprietary/vendor/etc/vintf/manifest/dms-service.xml \
    vendor/dolby/proprietary/vendor/etc/vintf/manifest/vendor.dolby.media.c2.v1.0@1.0-service.xml \
    vendor/dolby/proprietary/vendor/etc/vintf/manifest/vendor.dolby.vision.media.c2@1.0-service.xml

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/dolby/sepolicy/vendor

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.dolby.dax.version=DAX3_3.5.1.28_r1 \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false
