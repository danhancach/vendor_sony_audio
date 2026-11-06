# Sony Xperia 5 V — stock Dolby (A15 → AOSP 17)

Port of **stock Sony Dolby DAP** from Android 15 firmware (pdx237) to AOSP 17. Native Dolby libraries are not hex-patched. DSP only applies when `DlbGenClass2: Security Check is PASS`.

**Xperia 5 V / pdx237 only.** Not a GitHub or Magisk Dolby module.

```text
proprietary/   stock A15 native blobs; customized daxService (see below)
configs/       port overlay (DMS early_hal, VINTF matrix)
sepolicy/      DMS + platform_app_36
```

Parent tree: `vendor/sony/audio/dolby/` (see `../README.md`).

## Speaker mono integration

`daxService.apk` retains Sony rotation parameters and tuning, but its
`SwapConditionListener.publishRotation()` no longer writes Accessibility
`master_mono`. Speaker mono is owned by AudioService and AudioPolicy, using
the separate `sony_speaker_portrait_mono` preference exposed by SoundEnhancement.
The APK change is limited to `classes.dex`; native Dolby libraries and other
ZIP entry contents are unchanged. The platform certificate is applied by the
existing `android_app_import` during the ROM build.

This requires a matching framework, JNI, audio stack, and app build. Installing
only the app or native audio libraries does not deploy the full feature.
Accessibility mono is not automatically cleared, including legacy values left
by the previous service customization.

## Integrate into a ROM

**1. Device makefile** — inherit umbrella `vendor/sony/audio/config.mk` (or this module only via `dolby/config.mk`).

**2. Identity** — required by `libswdap`. Keep the XQ-DE72 attestation fingerprint; **do not** set `DeviceName=XQ-DE72`.

```makefile
PRODUCT_DEVICE := pdx237
PRODUCT_BUILD_PROP_OVERRIDES += ProductModel=Pdx237
```

`dolby.mk` sets `ro.product.vendor.model=Pdx237`. **Do not** set `ro.product.vendor.name` if `PRODUCT_NAME` already writes that property.

**3. ROM patches** (after every `repo sync` of `frameworks/av`):

```bash
device/sony/pdx237/patchs/apply.sh
```

Hub: `device/sony/pdx237/patchs/` (AudioFlinger + AudioPolicy + related). Không giữ patch trong repo audio này.

**4. VINTF** — install HAL manifests as fragments only (`prebuilt_etc_xml`). Do not also add the same XML to `DEVICE_MANIFEST_FILE`.

## After flash

```bash
vendor/sony/audio/dolby/scripts/diagnose.sh
```

Expect `DlbGenClass2: Dolby Security Check is PASS`. Audible check: speaker, Dynamic profile, toggle Dolby on/off.

Verbose identity: `adb shell setprop persist.vendor.dolby.loglevel 1`, then restart audioserver.
