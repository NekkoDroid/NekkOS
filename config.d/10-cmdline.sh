#!/bin/bash
set -e

echo "Setting kernel command line arguments"
mkdir -p /etc/kernel

COMMON_CMDLINE_ARGS="rw nvidia_drm.modeset=1"

cat << EOF > /etc/kernel/cmdline-system
$COMMON_CMDLINE_ARGS resume=/dev/disk/by-partlabel/swap quiet splash
EOF

cat << EOF > /etc/kernel/cmdline-rescue
$COMMON_CMDLINE_ARGS systemd.unit=rescue.target
EOF
