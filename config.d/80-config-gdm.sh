#!/bin/bash
set -e

# GDM for some reason still disables Wayland on NVIDIA
# (even on modern versions of the driver post 510)
echo "Disabling GDM checks for NVIDIA"
ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
