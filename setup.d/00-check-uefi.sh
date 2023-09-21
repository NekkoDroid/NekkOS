#!/bin/bash
set -e

if [[ "$(cat /sys/firmware/efi/fw_platform_size)" != "64" ]]; then
    echo "Unsupported platform configuration (not using UEFI x64)"
    return 1
fi
