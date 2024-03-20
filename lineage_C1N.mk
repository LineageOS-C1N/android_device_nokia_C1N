# Inherit some common Lineage stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device
$(call inherit-product, device/nokia/C1N/device.mk)

BUILD_FINGERPRINT := Nokia/TA-1041_00CN/C1N:9/PPR1.180610.011/00CN_3_40C:user/release-keys
PRODUCT_BRAND := Nokia
PRODUCT_DEVICE := C1N
PRODUCT_MANUFACTURER := HMD Global
PRODUCT_MODEL := Nokia 7
PRODUCT_NAME := lineage_C1N

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=C1N \
    PRODUCT_NAME=TA-1041_00CN \
    PRIVATE_BUILD_DESC="TA-1041_00CN-user 9 PPR1.180610.011 00CN_3_40C release-keys"
