#!/bin/bash
set -e

# Set the current CWD to the script directory
# (So that relative file includes work as expected)
cd "$(dirname "${BASH_SOURCE[0]}")"

for script in ./config.d/*.sh; do
    source $script
done

read -p "Press [ENTER] to finish the configuration"
exit
