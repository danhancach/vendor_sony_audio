#ifndef HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BPHWDMS_H
#define HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BPHWDMS_H

#include <hidl/HidlTransportSupport.h>

#include <vendor/dolby/hardware/dms/2.0/IHwDms.h>

#include <mutex>
namespace vendor {
namespace dolby {
namespace hardware {
namespace dms {
namespace V2_0 {

struct BpHwDms : public ::android::hardware::BpInterface<IDms>, public ::android::hardware::details::HidlInstrumentor {
    explicit BpHwDms(const ::android::sp<::android::hardware::IBinder> &_hidl_impl);

    /**
     * The pure class is what this class wraps.
     */
    typedef IDms Pure;

    /**
     * Type tag for use in template logic that indicates this is a 'proxy' class.
     */
    typedef ::android::hardware::details::bphw_tag _hidl_tag;

    virtual bool isRemote() const override { return true; }

    void onLastStrongRef(const void* id) override;

    // Methods from ::vendor::dolby::hardware::dms::V2_0::IDms follow.
    static ::android::hardware::Return<void>  _hidl_registerClient(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDmsCallbacks>& callbacks, int32_t sessionId, int32_t ioHandle);
    static ::android::hardware::Return<void>  _hidl_unregisterClient(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDmsCallbacks>& callbacks, int32_t sessionId, int32_t ioHandle);
    static ::android::hardware::Return<void>  _hidl_registerVqeCallback(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks>& callbacks);
    static ::android::hardware::Return<void>  _hidl_unregisterVqeCallback(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks>& callbacks);
    static ::android::hardware::Return<void>  _hidl_registerDecCallback(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDecCallbacks>& callbacks);
    static ::android::hardware::Return<void>  _hidl_unregisterDecCallback(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDecCallbacks>& callbacks);
    static ::android::hardware::Return<void>  _hidl_getStoredParams(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, bool forceReload, int32_t profileId, getStoredParams_cb _hidl_cb);
    static ::android::hardware::Return<void>  _hidl_setDapParam(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::hardware::hidl_vec<uint8_t>& param);
    static ::android::hardware::Return<void>  _hidl_getDapParam(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::hardware::hidl_vec<uint8_t>& request, getDapParam_cb _hidl_cb);
    static ::android::hardware::Return<void>  _hidl_getProfileName(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t profileId, getProfileName_cb _hidl_cb);
    static ::android::hardware::Return<int32_t>  _hidl_getAvailableTuningDevicesLen(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t profileId);
    static ::android::hardware::Return<void>  _hidl_getAvailableTuningDevices(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t profileId, getAvailableTuningDevices_cb _hidl_cb);
    static ::android::hardware::Return<void>  _hidl_getSelectedTuningDevice(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t profileId, getSelectedTuningDevice_cb _hidl_cb);
    static ::android::hardware::Return<void>  _hidl_setSelectedTuningDevice(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t profileId, const ::android::hardware::hidl_vec<uint8_t>& device);
    static ::android::hardware::Return<int64_t>  _hidl_getIntParam(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t paramId);
    static ::android::hardware::Return<void>  _hidl_setIntParam(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t paramId, int64_t value);
    static ::android::hardware::Return<void>  _hidl_getIntParams(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::hardware::hidl_vec<int32_t>& paramIds, getIntParams_cb _hidl_cb);
    static ::android::hardware::Return<void>  _hidl_setIntParams(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, const ::android::hardware::hidl_vec<int32_t>& paramIds, const ::android::hardware::hidl_vec<int64_t>& values);
    static ::android::hardware::Return<void>  _hidl_setActiveDevice(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t device);
    static ::android::hardware::Return<int32_t>  _hidl_getActiveDevice(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor);
    static ::android::hardware::Return<void>  _hidl_setChannelCount(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t count);
    static ::android::hardware::Return<int32_t>  _hidl_getChannelCount(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor);
    static ::android::hardware::Return<void>  _hidl_notifyAudioTrackChange(::android::hardware::IInterface* _hidl_this, ::android::hardware::details::HidlInstrumentor *_hidl_this_instrumentor, int32_t sessionId, int32_t ioHandle, int32_t streamType, int32_t trackId, int32_t state, int32_t sampleRate, int32_t channelMask);

    // Methods from ::vendor::dolby::hardware::dms::V2_0::IDms follow.
    ::android::hardware::Return<void> registerClient(const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDmsCallbacks>& callbacks, int32_t sessionId, int32_t ioHandle) override;
    ::android::hardware::Return<void> unregisterClient(const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDmsCallbacks>& callbacks, int32_t sessionId, int32_t ioHandle) override;
    ::android::hardware::Return<void> registerVqeCallback(const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks>& callbacks) override;
    ::android::hardware::Return<void> unregisterVqeCallback(const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IVqeCallbacks>& callbacks) override;
    ::android::hardware::Return<void> registerDecCallback(const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDecCallbacks>& callbacks) override;
    ::android::hardware::Return<void> unregisterDecCallback(const ::android::sp<::vendor::dolby::hardware::dms::V2_0::IDecCallbacks>& callbacks) override;
    ::android::hardware::Return<void> getStoredParams(bool forceReload, int32_t profileId, getStoredParams_cb _hidl_cb) override;
    ::android::hardware::Return<void> setDapParam(const ::android::hardware::hidl_vec<uint8_t>& param) override;
    ::android::hardware::Return<void> getDapParam(const ::android::hardware::hidl_vec<uint8_t>& request, getDapParam_cb _hidl_cb) override;
    ::android::hardware::Return<void> getProfileName(int32_t profileId, getProfileName_cb _hidl_cb) override;
    ::android::hardware::Return<int32_t> getAvailableTuningDevicesLen(int32_t profileId) override;
    ::android::hardware::Return<void> getAvailableTuningDevices(int32_t profileId, getAvailableTuningDevices_cb _hidl_cb) override;
    ::android::hardware::Return<void> getSelectedTuningDevice(int32_t profileId, getSelectedTuningDevice_cb _hidl_cb) override;
    ::android::hardware::Return<void> setSelectedTuningDevice(int32_t profileId, const ::android::hardware::hidl_vec<uint8_t>& device) override;
    ::android::hardware::Return<int64_t> getIntParam(int32_t paramId) override;
    ::android::hardware::Return<void> setIntParam(int32_t paramId, int64_t value) override;
    ::android::hardware::Return<void> getIntParams(const ::android::hardware::hidl_vec<int32_t>& paramIds, getIntParams_cb _hidl_cb) override;
    ::android::hardware::Return<void> setIntParams(const ::android::hardware::hidl_vec<int32_t>& paramIds, const ::android::hardware::hidl_vec<int64_t>& values) override;
    ::android::hardware::Return<void> setActiveDevice(int32_t device) override;
    ::android::hardware::Return<int32_t> getActiveDevice() override;
    ::android::hardware::Return<void> setChannelCount(int32_t count) override;
    ::android::hardware::Return<int32_t> getChannelCount() override;
    ::android::hardware::Return<void> notifyAudioTrackChange(int32_t sessionId, int32_t ioHandle, int32_t streamType, int32_t trackId, int32_t state, int32_t sampleRate, int32_t channelMask) override;

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

#endif  // HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_BPHWDMS_H
