#!/bin/bash
set -e

echo "Installing packages to the new system"
pacstrap -K /mnt                                                                \
    base{,-devel} linux{,-firmware} {amd,intel}-ucode broadcom-wl fwupd         \
    qrencode libpwquality tpm2-tss libp11-kit libfido2 sbctl                    \
    lvm2 e2fsprogs exfatprogs btrfs-progs                                       \
    {archlinux,pacman}-contrib pkgstats                                         \
    posix man-pages openssh neovim bluez iptables-nft                           \
    nvidia{,-utils} vulkan-{radeon,intel}                                       \
    libva-{nvidia,mesa,intel}-driver intel-media-driver                         \
    pipewire{,-{audio,pulse,alsa,jack,v4l2}} wireplumber                        \
    gstreamer{,-vaapi} gst-plugin-pipewire gst-plugins-{good,bad,ugly}          \
    noto-fonts{,-{cjk,extra,emoji}} ttf-nerd-fonts-symbols{,-mono}              \
    gdm gnome-{shell,backgrounds,themes-extra,remote-desktop,user-share}        \
    gnome-{control-center,software,terminal} nautilus power-profiles-daemon     \
    xdg-{utils,user-dirs-gtk,desktop-portal-gnome} wl-clipboard                 \
    podman cni-plugins flatpak toolbox
