#!/bin/bash
set -e

echo "Configuring mkinitcpio modules and hooks"
sed -i "s/^MODULES=.*/MODULES=(amdgpu i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/g" /etc/mkinitcpio.conf
sed -i "s/^HOOKS=.*/HOOKS=(base systemd autodetect modconf kms block keyboard sd-vconsole filesystems fsck plymouth)/g" /etc/mkinitcpio.conf
