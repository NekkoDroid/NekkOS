#!/bin/bash
set -e

echo "Creating mkinitcpio post build hook to sign UKIs"
mkdir -p /etc/initcpio/post
cat << EOF >> /etc/initcpio/post/sbctl-sign
#!/bin/bash
[[ -n "\$3" ]] && sbctl sign "\$3"
EOF
chmod +x /etc/initcpio/post/sbctl-sign
