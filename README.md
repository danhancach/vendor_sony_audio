# Sony Xperia stock audio (pdx237)

Umbrella tree for stock Sony audio ports on AOSP 17:

```text
vendor/sony/audio/
├── config.mk      # ROM entry — inherit from device.mk
├── dolby/         # Dolby DAP + DMS (stock A15 port)
├── 360RA/         # 360 Reality Audio (placeholder)
└── DSEE/          # DSEE-HX (placeholder)
```

## Integrate

```makefile
# device/sony/pdx237/device.mk
$(call inherit-product, vendor/sony/audio/config.mk)
```

## Manifest

```xml
<project path="vendor/sony/audio"
         name="danhancach/vendor_sony_audio"
         remote="github-non-los"
         revision="check-dolby"
         groups="pdx237,notdefault" />
```

`dolby/` details: [dolby/README.md](dolby/README.md)
