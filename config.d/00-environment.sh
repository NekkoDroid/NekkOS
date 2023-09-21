#!/bin/bash
set -e

echo "Setting default environment variables"
cat << EOF >> /etc/environment
EDITOR=nvim
VISUAL=nvim
EOF
