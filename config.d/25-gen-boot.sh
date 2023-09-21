#!/bin/bash
set -e

echo "Regenerating '/boot' files"
mkinitcpio -P
bootctl install
