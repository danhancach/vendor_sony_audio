# Sony Xperia 5 V — stock Dolby (A15 → AOSP 17)

Port of **stock Sony Dolby DAP** from Android 15 firmware (pdx237) to AOSP 17. Blobs are not hex-patched. DSP only applies when `DlbGenClass2: Security Check is PASS`.

**Xperia 5 V / pdx237 only.** Not a GitHub or Magisk Dolby module.

```text
proprietary/   stock A15 blobs (SHA must match firmware)
configs/       port overlay (DMS early_hal, VINTF matrix)
sepolicy/      DMS + platform_app_36
patches/       frameworks/av (AudioFlinger + AudioPolicy)
```

## Integrate into a ROM

**1. Tree path**

```text
vendor/sony/dolby
```

Local manifest example:

```xml
<project path="vendor/sony/dolby"
         name="danhancach/vendor_dolby"
         remote="github-non-los"
         revision="xperia-5v"
         groups="pdx237,notdefault" />
```

**2. Device makefile** — inherit after vendor blobs; strip any Yodo Dolby stack first:

```makefile
PRODUCT_PACKAGES := $(filter-out DolbySound vendor.dolby.hardware.dms@2.0-service ...,$(PRODUCT_PACKAGES))

$(call inherit-product, vendor/sony/dolby/config.mk)
```

`config.mk` pulls in `dolby.mk` (packages, sepolicy, VINTF fragment, `audio_effects.xml`).

**3. Identity** — required by `libswdap`. Keep the XQ-DE72 attestation fingerprint; **do not** set `DeviceName=XQ-DE72`.

```makefile
PRODUCT_DEVICE := pdx237
PRODUCT_BUILD_PROP_OVERRIDES += ProductModel=Pdx237
```

`dolby.mk` already sets `ro.product.vendor.model=Pdx237`. **Do not** set `ro.product.vendor.name` if `PRODUCT_NAME` already writes that property (duplicate sysprop).

**4. ROM patches** (after every `repo sync` of `frameworks/av`):

```bash
vendor/sony/dolby/patches/apply.sh
```

**5. VINTF** — install HAL manifests as fragments only (`prebuilt_etc_xml`). Do not also add the same XML to `DEVICE_MANIFEST_FILE`.

## After flash

```bash
vendor/sony/dolby/scripts/diagnose.sh
```

Expect `DlbGenClass2: Dolby Security Check is PASS`. Audible check: speaker, Dynamic profile, toggle Dolby on/off.

Verbose identity: `adb shell setprop persist.vendor.dolby.loglevel 1`, then restart audioserver.
