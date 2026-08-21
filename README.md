# Sony Xperia stock audio (pdx237)

Umbrella tree for stock Sony audio ports on AOSP 17:

```text
vendor/sony/audio/
├── config.mk           # ROM entry — inherit from device.mk
├── dolby/              # Dolby DAP + DMS (stock A15 port)
├── soundenhancement/   # Sound Enhancement UI (stock A15 priv-app)
├── 360RA/              # 360 Reality Audio (placeholder)
└── DSEE/               # DSEE-HX params + frameworks/av codec notify patch
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
