#!/bin/bash
set -e

# Early exit since no format is requested
test -v FORMAT || return 0

if [[ ! -e "$FORMAT" ]]; then
    echo "Drive '$FORMAT' does not exist"
    return 1
fi

echo "Partitioning drive '$FORMAT'"
sgdisk --clear                                            \
    --new=1:0:+4G  --typecode=1:ef00 --change-name=1:boot \
    --new=2:0:+16G --typecode=2:8200 --change-name=2:swap \
    --new=3:0:0    --typecode=3:8304 --change-name=3:root \
    $FORMAT

# Ensure system is done writing before continuing
sleep 1

echo "Formatting drive '$FORMAT'"
mkfs.fat -F32 /dev/disk/by-partlabel/boot
mkfs.ext4 /dev/disk/by-partlabel/root
mkswap /dev/disk/by-partlabel/swap
