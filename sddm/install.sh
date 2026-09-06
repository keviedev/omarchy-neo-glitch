#!/bin/bash
# Install the Neo Glitch SDDM login theme (run with sudo).
# Copies the theme to /usr/share/sddm/themes/neo-glitch and switches SDDM to it.
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo: sudo bash $0" >&2
  exit 1
fi

SRC="$(cd "$(dirname "$0")" && pwd)/neo-glitch"
DEST=/usr/share/sddm/themes/neo-glitch

rm -rf "$DEST"
cp -r "$SRC" "$DEST"

CONF=/etc/sddm.conf.d/10-theme.conf
# SDDM parses ALL files in conf.d (not just *.conf), sorted alphabetically,
# so backups must live outside the directory or they override the real config.
mkdir -p /var/backups/sddm
cp "$CONF" "/var/backups/sddm/10-theme.conf.bak.$(date +%s)" 2>/dev/null || true
cat > "$CONF" <<'EOF'
[Theme]
Current=neo-glitch
EOF

echo "Installed. Neo Glitch SDDM theme active on next logout/reboot."
echo "Revert anytime with: sudo cp /var/backups/sddm/10-theme.conf.bak.* /etc/sddm.conf.d/10-theme.conf"