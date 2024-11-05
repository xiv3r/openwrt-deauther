#!/bin/sh -e

# Install aircrack-ng
opkg install aircrack-ng openssh-sftp-server

echo "echo 'mon0 monitor mode enable'" > monitor-mode.sh
echo "iw phy phy0 interface add mon0 type monitor" >> monitor-mode.sh
echo "ip link set mon0 up" >> monitor-mode.sh

# Make Executable
chmod +x monitor-mode.sh
sh monitor_mode.sh

# Launch airodump-ng
airodump-ng mon0
