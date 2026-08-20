#ifndef HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BNHWVQECALLBACKS_H
#define HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BNHWVQECALLBACKS_H

#include <vendor/dolby/hardware/dms/2.0/IHwVqeCallbacks.h>

namespace vendor {
namespace dolby {
namespace hardware {
namespace dms {
namespace V2_0 {

struct BnHwVqeCallbacks : public ::android::hidl::base::V1_0::BnHwBase {
    explicit BnHwVqeCallbacks(const ::android::sp<IVqeCallbacks> &_hidl_impl);
    explicit BnHwVqeCallbacks(const ::android::sp<IVqeCallbacks> &_hidl_impl, const std::string& HidlInstrumentor_package, const std::string& HidlInstrumentor_interface);

    virtual ~BnHwVqeCallbacks();

    ::android::status_t onTransact(
            uint32_t _hidl_code,
            const ::android::hardware::Parcel &_hidl_data,
            ::android::hardware::Parcel *_hidl_reply,
            uint32_t _hidl_flags = 0,
            TransactCallback _hidl_cb = nullptr) override;


    /**
     * The pure class is what this class wraps.
     */
    typedef IVqeCallbacks Pure;

    /**
     * Type tag for use in template logic that indicates this is a 'native' class.
     */
    typedef ::android::hardware::details::bnhw_tag _hidl_tag;

    ::android::sp<IVqeCallbacks> getImpl() { return _hidl_mImpl; }
    // Methods from ::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks follow.
    static ::android::status_t _hidl_onAudioTrackChange(
            ::android::hidl::base::V1_0::BnHwBase* _hidl_this,
            const ::android::hardware::Parcel &_hidl_data,
            ::android::hardware::Parcel *_hidl_reply,
            TransactCallback _hidl_cb);



private:
    // Methods from ::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks follow.

    // Methods from ::android::hidl::base::V1_0::IBase follow.
    ::android::hardware::Return<void> ping();
    using getDebugInfo_cb = ::android::hidl::base::V1_0::IBase::getDebugInfo_cb;
    ::android::hardware::Return<void> getDebugInfo(getDebugInfo_cb _hidl_cb);

    ::android::sp<IVqeCallbacks> _hidl_mImpl;
};

}  // namespace V2_0
}  // namespace dms
}  // namespace hardware
}  // namespace dolby
}  // namespace vendor

#endif  // HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BNHWVQECALLBACKS_H
