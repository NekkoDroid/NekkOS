#!/bin/bash
set -e

echo "Disabling some unused desktop file entries"
mkdir -p /usr/local/share/applications
ln -s /dev/null /usr/local/share/applications/org.gnome.Extensions.desktop
ln -s /dev/null /usr/local/share/applications/avahi-discover.desktop
ln -s /dev/null /usr/local/share/applications/cups.desktop
ln -s /dev/null /usr/local/share/applications/bssh.desktop
ln -s /dev/null /usr/local/share/applications/bvnc.desktop
ln -s /dev/null /usr/local/share/applications/qv4l2.desktop
ln -s /dev/null /usr/local/share/applications/qvidcap.desktop
ln -s /dev/null /usr/local/share/applications/nvim.desktop
