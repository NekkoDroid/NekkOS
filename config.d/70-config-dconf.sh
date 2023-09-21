#!/bin/bash
set -e

echo "Configuring default favorite applications"

mkdir -p /etc/dconf/profile
cat << EOF >> /etc/dconf/profile/user
user-db:user
system-db:local
EOF

mkdir -p /etc/dconf/db/local.d
cat << EOF >> /etc/dconf/db/local.d/00-favorite-apps
[org/gnome/shell]
favorite-apps = ['org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'org.gnome.Settings.desktop']
EOF

dconf update
