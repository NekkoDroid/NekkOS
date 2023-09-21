#!/bin/bash
set -e

echo "Configuring default elevated roles"
cat << EOF >> /etc/sudoers.d/elevated-roles
%wheel ALL=(ALL:ALL) ALL
%sudo ALL=(ALL:ALL) ALL
EOF
