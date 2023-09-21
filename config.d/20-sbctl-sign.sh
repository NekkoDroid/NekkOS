#!/bin/bash
set -e

echo "Configuring secure boot and signing files"
sbctl create-keys
sbctl enroll-keys -m
sbctl sign -s /boot/vmlinuz-linux
sbctl sign -s -o                                         \
    /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed \
    /usr/lib/systemd/boot/efi/systemd-bootx64.efi
