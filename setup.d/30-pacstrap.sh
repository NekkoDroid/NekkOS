#!/bin/bash
set -e

echo "Installing packages to the new system"
pacstrap -K /mnt                                                                \
    base linux{,-firmware} power-profiles-daemon bash-completion                \
    {amd,intel}-ucode nvidia{,-{utils,prime}} broadcom-wl networkmanager fwupd  \
    bluez{,-utils} iptables-nft pipewire{,-{audio,pulse,alsa,jack}} wireplumber \
    vulkan-{radeon,intel} libva-mesa-driver mesa-vdpau switcheroo-control       \
    noto-fonts{,-{cjk,extra,emoji}} ttf-nerd-fonts-symbols{,-mono}              \
    gdm gnome-{shell,backgrounds,software,control-center,themes-extra}          \
    gnome-{remote-desktop,user-share,initial-setup,termminal} nautilus          \
    xdg-{utils,user-dirs-gtk,desktop-portal-gnome} flatpak                      \
    neovim wl-clipboard {archlinux,pacman}-contrib pkgstats sbctl plymouth
