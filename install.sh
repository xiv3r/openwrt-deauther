#!/bin/sh -e

opkg update && opkg install aircrack-ng openssh-sftp-server
sed -i 's/exit 0//' /etc/rc.local
echo "iw phy phy0 interface add mon0 type monitor" >> /etc/rc.local
echo "ip link set mon0 up" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
chmod +x /etc/rc.local
sh /etc/rc.local
aircrack-ng --help && airodump-ng --help && aireplay-ng --help
airodump-ng mon0
