#ifndef HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BPHWVQECALLBACKS_H
#define HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BPHWVQECALLBACKS_H

#include <hidl/HidlTransportSupport.h>

#include <vendor/dolby/hardware/dms/2.0/IHwVqeCallbacks.h>

#include <mutex>
namespace vendor {
namespace dolby {
namespace hardware {
namespace dms {
namespace V2_0 {

struct BpHwVqeCallbacks : public ::android::hardware::BpInterface<IVqeCallbacks>, public ::android::hardware::details::HidlInstrumentor {
    explicit BpHwVqeCallbacks(const ::android::sp<::android::hardware::IBinder> &_hidl_impl);

    /**
     * The pure class is what this class wraps.
     */
    typedef IVqeCallbacks Pure;

    /**
     * Type tag for use in template logic that indicates this is a 'proxy' class.
     */
    typedef ::android::hardware::details::bphw_tag _hidl_tag;

    virtual bool isRemote() const override { return true; }

    void onLastStrongRef(const void* id) override;

    // Methods from ::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks follow.
    static ::android::hardware::Return<void>  _hidl_onAudioTrackChange(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t sessionId, int32_t ioHandle, int32_t streamType, int32_t trackId, int32_t state, int32_t sampleRate, int32_t channelMask);

    // Methods from ::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks follow.
    ::android::hardware::Return<void> onAudioTrackChange(int32_t sessionId, int32_t ioHandle, int32_t streamType, int32_t trackId, int32_t state, int32_t sampleRate, int32_t channelMask) override;

    // Methods from ::android::hidl::base::V1_0::IBase follow.
    ::android::hardware::Return<void> interfaceChain(interfaceChain_cb _hidl_cb) override;
    ::android::hardware::Return<void> debug(const ::android::hardware::hidl_handle& fd, const ::android::hardware::hidl_vec<::android::hardware::hidl_string>& options) override;
    ::android::hardware::Return<void> interfaceDescriptor(interfaceDescriptor_cb _hidl_cb) override;
    ::android::hardware::Return<void> getHashChain(getHashChain_cb _hidl_cb) override;
    ::android::hardware::Return<void> setHALInstrumentation() override;
    ::android::hardware::Return<bool> linkToDeath(const ::android::sp<::android::hardware::hidl_death_recipient>& recipient, uint64_t cookie) override;
    ::android::hardware::Return<void> ping() override;
    ::android::hardware::Return<void> getDebugInfo(getDebugInfo_cb _hidl_cb) override;
    ::android::hardware::Return<void> notifySyspropsChanged() override;
    ::android::hardware::Return<bool> unlinkToDeath(const ::android::sp<::android::hardware::hidl_death_recipient>& recipient) override;

private:
    std::mutex _hidl_mMutex;
    std::vector<::android::sp<::android::hardware::hidl_binder_death_recipient>> _hidl_mDeathRecipients;
};

}  // namespace V2_0
}  // namespace dms
}  // namespace hardware
}  // namespace dolby
}  // namespace vendor

#endif  // HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BPHWVQECALLBACKS_H
