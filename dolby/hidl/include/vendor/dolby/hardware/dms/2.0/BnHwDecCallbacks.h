#ifndef HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BNHWDECCALLBACKS_H
#define HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BNHWDECCALLBACKS_H

#include <vendor/dolby/hardware/dms/2.0/IHwDecCallbacks.h>

namespace vendor {
namespace dolby {
namespace hardware {
namespace dms {
namespace V2_0 {

struct BnHwDecCallbacks : public ::android::hidl::base::V1_0::BnHwBase {
    explicit BnHwDecCallbacks(const ::android::sp<IDecCallbacks> &_hidl_impl);
    explicit BnHwDecCallbacks(const ::android::sp<IDecCallbacks> &_hidl_impl, const std::string& HidlInstrumentor_package, const std::string& HidlInstrumentor_interface);

    virtual ~BnHwDecCallbacks();

    ::android::status_t onTransact(
            uint32_t _hidl_code,
            const ::android::hardware::Parcel &_hidl_data,
            ::android::hardware::Parcel *_hidl_reply,
            uint32_t _hidl_flags = 0,
            TransactCallback _hidl_cb = nullptr) override;


    /**
     * The pure class is what this class wraps.
     */
    typedef IDecCallbacks Pure;

    /**
     * Type tag for use in template logic that indicates this is a 'native' class.
     */
    typedef ::android::hardware::details::bnhw_tag _hidl_tag;

    ::android::sp<IDecCallbacks> getImpl() { return _hidl_mImpl; }
    // Methods from ::vendor::dolby::hardware::dms::V2_0::IDecCallbacks follow.
    static ::android::status_t _hidl_onDecChanged(
            ::android::hidl::base::V1_0::BnHwBase* _hidl_this,
            const ::android::hardware::Parcel &_hidl_data,
            ::android::hardware::Parcel *_hidl_reply,
            TransactCallback _hidl_cb);



private:
    // Methods from ::vendor::dolby::hardware::dms::V2_0::IDecCallbacks follow.

    // Methods from ::android::hidl::base::V1_0::IBase follow.
    ::android::hardware::Return<void> ping();
    using getDebugInfo_cb = ::android::hidl::base::V1_0::IBase::getDebugInfo_cb;
    ::android::hardware::Return<void> getDebugInfo(getDebugInfo_cb _hidl_cb);

    ::android::sp<IDecCallbacks> _hidl_mImpl;
};

}  // namespace V2_0
}  // namespace dms
}  // namespace hardware
}  // namespace dolby
}  // namespace vendor

#endif  // HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BNHWDECCALLBACKS_H
