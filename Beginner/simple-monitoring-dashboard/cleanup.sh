#!/bin/bash

# Removes Netdata from the system.

sudo systemctl stop netdata
sudo systemctl disable netdata

if command -v apt &>/dev/null; then
  sudo apt purge -y netdata
elif command -v yum &>/dev/null; then
  sudo yum remove -y netdata
fi

sudo rm -rf /etc/netdata /var/lib/netdata /var/cache/netdata /var/log/netdata

echo "Netdata removed successfully."