#!/bin/bash
set -e

# Set the current CWD to the script directory
# (So that relative file includes work as expected)
cd "$(dirname "${BASH_SOURCE[0]}")"

for script in ./setup.d/*.sh; do
    source $script
done

echo "Copying configuration scripts to new system"
cp -r ./config.* /mnt/root

echo "Beginning configuration in new system"
arch-chroot /mnt /root/config.sh

echo "Deleting configuration scripts from new system"
rm -r /mnt/root/config.*

read -p "Press [ENTER] to reboot into the new system"
reboot
