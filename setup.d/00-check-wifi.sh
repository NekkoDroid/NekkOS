#!/bin/bash
set -e

if ! ping -c 1 "archlinux.org"; then
    echo "Failed to ping 'archlinux.org', check your internet connection"
    return 1
fi
