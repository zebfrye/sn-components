#!/bin/bash
set -e

# Install dbus to satisfy installer dependencies
sudo apt-get update
sudo apt-get install -y dbus-x11

# Download ServiceNow CLI zip
curl -L https://github.com/ServiceNow/servicenow-cli/releases/download/v1.1.3/snc-1.1.3.zip -o /tmp/snc.zip

# Unzip
unzip -o /tmp/snc.zip -d /tmp/snc-extract

# Run the Linux x64 installer
chmod +x /tmp/snc-extract/snc-1.1.3-linux-x64-installer.run
sudo /tmp/snc-extract/snc-1.1.3-linux-x64-installer.run --mode unattended

# Find snc binary and symlink to PATH
SNC_BIN=$(find / -name "snc" -type f 2>/dev/null | head -1)
echo "Found snc at: $SNC_BIN"
sudo ln -sf "$SNC_BIN" /usr/local/bin/snc

echo "ServiceNow CLI installed: $(snc version)"