#!/bin/sh -e

# Install aircrack-ng
opkg install aircrack-ng openssh-sftp-server

# Remove exit 0 from the top
sed -i 's/exit 0//' /etc/rc.local

# Copy cli to rc.local
echo "iw phy phy0 interface add mon0 type monitor" >> /etc/rc.local
echo "ip link set mon0 up" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

# Make Executable
chmod +x /etc/rc.local
cp /etc/rc.local /root/monitor_mode.sh
sed -i 's/exit 0//' /root/monitor_mode.sh
chmod +x monitor_mode.sh
sh monitor_mode.sh

# Launch airodump
airodump-ng mon0
