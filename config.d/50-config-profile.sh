#!/bin/bash
set -e

echo "Exporting XDG base directories for all users"
cat << EOF >> /etc/profile.d/xdg-base-dirs.sh
export XDG_CONFIG_HOME="\$HOME/.config"
export XDG_CACHE_HOME="\$HOME/.cache"
export XDG_DATA_HOME="\$HOME/.local/share"
export XDG_STATE_HOME="\$HOME/.local/state"

# Fix some misbehaving applications
export CUDA_CACHE_PATH="\$XDG_CACHE_HOME/nvidia"
export GNUPG_HOME="\$XDG_CONFIG_HOME/gnupg"
EOF
chmod +x /etc/profile.d/xdg-base-dirs.sh
