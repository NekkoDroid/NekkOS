#!/bin/bash
set -e

echo "Generating German and English locales"
sed -i '/de_DE.UTF-8/s/^#//' /etc/locale.gen
sed -i '/en_US.UTF-8/s/^#//' /etc/locale.gen
locale-gen
