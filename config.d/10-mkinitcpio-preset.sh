#!/bin/bash
set -e

echo "Configuring mkinitcpio to create UKIs"
cat << EOF > /etc/mkinitcpio.d/linux.preset
# mkinitcpio preset file for the 'linux' package

#ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-linux"
ALL_microcode=(/boot/*-ucode.img)

PRESETS=('system' 'rescue')

#system_config="/etc/mkinitcpio.conf"
#system_image="/boot/initramfs-linux-system.img"
system_uki="/boot/EFI/Linux/arch-linux-system.efi"
system_options="--cmdline /etc/kernel/cmdline-system"

#rescue_config="/etc/mkinitcpio.conf"
#rescue_image="/boot/initramfs-linux-rescue.img"
rescue_uki="/boot/EFI/Linux/arch-linux-rescue.efi"
rescue_options="--cmdline /etc/kernel/cmdline-rescue -S autodetect"
EOF
