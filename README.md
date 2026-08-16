# vendor/dolby — Motorola rtwo A16 Dolby stack

Clone to `vendor/dolby`. In `device.mk`:

```
$(call inherit-product, vendor/dolby/config.mk)
```

Refresh blobs from local Motorola dump:

```bash
./extract-from-moto-blob.sh
```

Source tree: `~/android/sony-stock-fw/moto-blob/rtwo`

## Stack

- DMS HAL: AIDL `vendor.dolby.dms` (`vendor.dolby.dms.service`)
- UI: `MotoDolbyDax3` + `daxService`
- Codec2: Dolby Vision / media C2 services

## audio_effects.xml

Motorola A16 has no `libhwdap` / `libswvqe`. Use software DAP only:

```xml
    <libraries>
        <library name="dap_sw" path="libswdap.so"/>
        <library name="dap_game" path="libswgamedap.so"/>
        <library name="dlbvol" path="libdlbvol.so"/>
    </libraries>
    <effects>
        <effect name="dap" library="dap_sw" uuid="6ab06da4-c516-4611-8166-452799218539"/>
        <effect name="dap_game" library="dap_game" uuid="0a8abfe0-e10d-4f05-8acc-d9c45140dba3"/>
        <effect name="dlbvol" library="dlbvol" uuid="9d4921da-8225-4f29-aefa-39537a04bcaa"/>
    </effects>
```
