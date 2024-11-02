#!/bin/sh -e

opkg update && opkg install aircrack-ng
iw phy phy0 interface add mon0 type monitor
ifconfig mon0 up
echo "iw phy phy0 interface add mon0 type monitor" >> /etc/rc.local
echo "ifconfig mon0 up" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
airodump-ng mon0
