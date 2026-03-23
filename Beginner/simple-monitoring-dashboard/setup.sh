#!/bin/bash

# Installs and starts Netdata on a Linux system.

curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh

sudo systemctl start netdata
sudo systemctl enable netdata

echo "Netdata is running at http://$(hostname -I | awk '{print $1}'):19999"