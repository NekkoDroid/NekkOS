#!/bin/bash
set -e

unset REQUIRED_PARTITION_MISSING
test -e /dev/disk/by-partlabel/boot || REQUIRED_PARTITION_MISSING=1
test -e /dev/disk/by-partlabel/root || REQUIRED_PARTITION_MISSING=1

if [ -v REQUIRED_PARTITION_MISSING ]; then
    echo "This script uses the 'Discoverable Partitions Specification' for mounting partitions."
    echo "There are 2 required partitions:"
    echo "A partition labeled 'boot' with type UUID 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'"
    echo "A partition labeled 'root' with type UUID '4f68bce3-e8cd-4db1-96e7-fbcaf984b709'"
    return 1
fi

echo "Mounting partitions for the new system"
mount --mkdir /dev/disk/by-partlabel/root /mnt
mount --mkdir /dev/disk/by-partlabel/boot /mnt/boot

if [ -e /dev/disk/by-partlabel/home ]; then
    echo "Found a partition labeled 'home', mounting at '/mnt/home'"
    mount --mkdir /dev/disk/by-partlabel/home /mnt/home
fi

if [ -e /dev/disk/by-partlabel/usr ]; then
    echo "Found a partition labeled 'usr', mounting at '/mnt/usr'"
    mount --mkdir /dev/disk/by-partlabel/usr /mnt/usr
fi

if [ -e /dev/disk/by-partlabel/srv ]; then
    echo "Found a partition labeled 'srv', mounting at '/mnt/srv'"
    mount --mkdir /dev/disk/by-partlabel/srv /mnt/srv
fi

if [ -e /dev/disk/by-partlabel/var ]; then
    echo "Found a partition labeled 'var', mounting at '/mnt/var'"
    mount --mkdir /dev/disk/by-partlabel/var /mnt/var
fi

if [ -e /dev/disk/by-partlabel/tmp ]; then
    echo "Found a partition labeled 'tmp', mounting at '/mnt/var/tmp'"
    mount --mkdir /dev/disk/by-partlabel/tmp /mnt/var/tmp
fi
