#!/bin/bash
set -e

# Download ServiceNow CLI zip
curl -L https://github.com/ServiceNow/servicenow-cli/releases/download/v1.1.3/snc-1.1.3.zip -o /tmp/snc.zip

# Unzip
cd /tmp
unzip -o /tmp/snc.zip -d /tmp/snc-extract

# Run the Linux x64 installer
chmod +x /tmp/snc-extract/snc-1.1.3-linux-x64-installer.run
sudo /tmp/snc-extract/snc-1.1.3-linux-x64-installer.run --mode unattended

echo "ServiceNow CLI installed: $(snc --version)"