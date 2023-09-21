#!/bin/bash
set -e

echo "Generating '/boot' files"
mkdir -p /boot/EFI/Linux
mkinitcpio -P
bootctl install

echo "Removing '/boot' initramfs images"
rm /boot/initramfs-linux*.img
