#ifndef HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_HWTYPES_H
#define HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_HWTYPES_H

#include <vendor/dolby/hardware/dms/2.0/types.h>


#include <hidl/Status.h>
#include <hwbinder/IBinder.h>
#include <hwbinder/Parcel.h>

namespace vendor {
namespace dolby {
namespace hardware {
namespace dms {
namespace V2_0 {
::android::status_t readEmbeddedFromParcel(
        const ::vendor::dolby::hardware::dms::V2_0::DapParamCache &obj,
        const ::android::hardware::Parcel &parcel,
        size_t parentHandle,
        size_t parentOffset);

::android::status_t writeEmbeddedToParcel(
        const ::vendor::dolby::hardware::dms::V2_0::DapParamCache &obj,
        ::android::hardware::Parcel *parcel,
        size_t parentHandle,
        size_t parentOffset);

::android::status_t readEmbeddedFromParcel(
        const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache &obj,
        const ::android::hardware::Parcel &parcel,
        size_t parentHandle,
        size_t parentOffset);

::android::status_t writeEmbeddedToParcel(
        const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache &obj,
        ::android::hardware::Parcel *parcel,
        size_t parentHandle,
        size_t parentOffset);

::android::status_t readEmbeddedFromParcel(
        const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache &obj,
        const ::android::hardware::Parcel &parcel,
        size_t parentHandle,
        size_t parentOffset);

::android::status_t writeEmbeddedToParcel(
        const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache &obj,
        ::android::hardware::Parcel *parcel,
        size_t parentHandle,
        size_t parentOffset);

}  // namespace V2_0
}  // namespace dms
}  // namespace hardware
}  // namespace dolby
}  // namespace vendor

#endif  // HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_HWTYPES_H
