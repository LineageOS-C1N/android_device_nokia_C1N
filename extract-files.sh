#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.

function blob_fixup() {
    case "${1}" in
        # Fix missing symbol _ZN7android8hardware7details17gBnConstructorMapE
        vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0.so | vendor/lib64/libvendor.goodix.hardware.fingerprintextension@1.0.so | vendor/lib64/libgoodixhwfingerprint_gxfp5288_c1n.so)
            "${PATCHELF}" --remove-needed "libhidlbase.so" "${2}"
            sed -i "s/libhidltransport.so/libhidlbase-v32.so\x00/" "${2}"
            ;;
        vendor/lib64/hw/fingerprint.gxfp5288_c1n.so)
            "${PATCHELF}" --add-needed "libhidlbase-v32.so" "${2}"
            ;;
    esac
}

if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=C1N
export DEVICE_COMMON=sdm660-common
export VENDOR=nokia

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
