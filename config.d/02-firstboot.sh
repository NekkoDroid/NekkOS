#!/bin/bash
set -e

echo "Running systemd-firstboot configuration"
systemd-firstboot --prompt --force
