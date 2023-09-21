#!/bin/bash
set -e

echo "Editing 'useradd' configuration file"
sed -i "s@/etc/skel@/dev/null@g" /etc/default/useradd
