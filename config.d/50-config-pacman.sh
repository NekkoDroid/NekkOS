#!/bin/bash
set -e

echo "Editing 'pacman' configuration file"
sed -i "/Color/s/^#//g" /etc/pacman.conf
sed -i "/VerbosePkgLists/s/^#//g" /etc/pacman.conf
sed -i "/ParallelDownloads/s/^#//g" /etc/pacman.conf
