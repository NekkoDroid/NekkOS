#!/bin/bash
set -e

echo "Editing 'bash' logout to clear the terminal"
cat << EOF >> /etc/bash.bash_logout
clear
reset
EOF
