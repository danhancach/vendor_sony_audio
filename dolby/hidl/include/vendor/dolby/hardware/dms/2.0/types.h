#ifndef HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_TYPES_H
#define HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_TYPES_H

#include <hidl/HidlSupport.h>
#include <hidl/MQDescriptor.h>
#include <utils/NativeHandle.h>
#include <utils/misc.h>

namespace vendor {
namespace dolby {
namespace hardware {
namespace dms {
namespace V2_0 {

// Forward declaration for forward reference support:
struct DapParamCache;
struct KeyValue_AudioDevice_DapParamCache;
struct KeyValue_DapParameterId_ValueCache;

typedef int32_t AudioDevice;

struct DapParamCache final {
    ::android::hardware::hidl_vec<int32_t> ids __attribute__ ((aligned(8)));
    ::android::hardware::hidl_vec<int32_t> values __attribute__ ((aligned(8)));
};

static_assert(offsetof(::vendor::dolby::hardware::dms::V2_0::DapParamCache, ids) == 0, "wrong offset");
static_assert(offsetof(::vendor::dolby::hardware::dms::V2_0::DapParamCache, values) == 16, "wrong offset");
static_assert(sizeof(::vendor::dolby::hardware::dms::V2_0::DapParamCache) == 32, "wrong size");
static_assert(__alignof(::vendor::dolby::hardware::dms::V2_0::DapParamCache) == 8, "wrong alignment");

struct KeyValue_AudioDevice_DapParamCache final {
    int32_t key __attribute__ ((aligned(4)));
    ::vendor::dolby::hardware::dms::V2_0::DapParamCache value __attribute__ ((aligned(8)));
};

static_assert(offsetof(::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache, key) == 0, "wrong offset");
static_assert(offsetof(::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache, value) == 8, "wrong offset");
static_assert(sizeof(::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache) == 40, "wrong size");
static_assert(__alignof(::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache) == 8, "wrong alignment");

struct KeyValue_DapParameterId_ValueCache final {
    int32_t key __attribute__ ((aligned(4)));
    ::android::hardware::hidl_vec<int32_t> value __attribute__ ((aligned(8)));
};

static_assert(offsetof(::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache, key) == 0, "wrong offset");
static_assert(offsetof(::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache, value) == 8, "wrong offset");
static_assert(sizeof(::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache) == 24, "wrong size");
static_assert(__alignof(::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache) == 8, "wrong alignment");

//
// type declarations for package
//

static inline std::string toString(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& o);
static inline void PrintTo(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& o, ::std::ostream*);
static inline bool operator==(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& rhs);
static inline bool operator!=(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& rhs);

static inline std::string toString(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& o);
static inline void PrintTo(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& o, ::std::ostream*);
static inline bool operator==(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& rhs);
static inline bool operator!=(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& rhs);

static inline std::string toString(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& o);
static inline void PrintTo(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& o, ::std::ostream*);
static inline bool operator==(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& rhs);
static inline bool operator!=(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& rhs);

//
// type header definitions for package
//

static inline std::string toString(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& o) {
    using ::android::hardware::toString;
    std::string os;
    os += "{";
    os += ".ids = ";
    os += ::android::hardware::toString(o.ids);
    os += ", .values = ";
    os += ::android::hardware::toString(o.values);
    os += "}"; return os;
}

static inline void PrintTo(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& o, ::std::ostream* os) {
    *os << toString(o);
}

static inline bool operator==(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& rhs) {
    if (lhs.ids != rhs.ids) {
        return false;
    }
    if (lhs.values != rhs.values) {
        return false;
    }
    return true;
}

static inline bool operator!=(const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::DapParamCache& rhs){
    return !(lhs == rhs);
}

static inline std::string toString(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& o) {
    using ::android::hardware::toString;
    std::string os;
    os += "{";
    os += ".key = ";
    os += ::android::hardware::toString(o.key);
    os += ", .value = ";
    os += ::vendor::dolby::hardware::dms::V2_0::toString(o.value);
    os += "}"; return os;
}

static inline void PrintTo(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& o, ::std::ostream* os) {
    *os << toString(o);
}

static inline bool operator==(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& rhs) {
    if (lhs.key != rhs.key) {
        return false;
    }
    if (lhs.value != rhs.value) {
        return false;
    }
    return true;
}

static inline bool operator!=(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_AudioDevice_DapParamCache& rhs){
    return !(lhs == rhs);
}

static inline std::string toString(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& o) {
    using ::android::hardware::toString;
    std::string os;
    os += "{";
    os += ".key = ";
    os += ::android::hardware::toString(o.key);
    os += ", .value = ";
    os += ::android::hardware::toString(o.value);
    os += "}"; return os;
}

static inline void PrintTo(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& o, ::std::ostream* os) {
    *os << toString(o);
}

static inline bool operator==(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& rhs) {
    if (lhs.key != rhs.key) {
        return false;
    }
    if (lhs.value != rhs.value) {
        return false;
    }
    return true;
}

static inline bool operator!=(const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& lhs, const ::vendor::dolby::hardware::dms::V2_0::KeyValue_DapParameterId_ValueCache& rhs){
    return !(lhs == rhs);
}


}  // namespace V2_0
}  // namespace dms
}  // namespace hardware
}  // namespace dolby
}  // namespace vendor

//
// global type declarations for package
//


#endif  // HIDL_GENERATED_VENDOR_DOLBY_HARDWARE_DMS_V2_0_TYPES_H
