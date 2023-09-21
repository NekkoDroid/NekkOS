#!/bin/bash
set -e

systemctl enable nftables
systemctl enable NetworkManager
systemctl enable systemd-boot-update
systemctl enable systemd-oomd
systemctl enable systemd-resolved
systemctl enable systemd-timedated
systemctl enable systemd-timesyncd
systemctl enable systemd-homed
systemctl enable bluetooth
systemctl enable power-profiles-daemon
systemctl enable switcheroo-control
systemctl enable pkgstats
systemctl enable fwupd
systemctl enable gdm
