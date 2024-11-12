#!/bin/sh

echo "
iw phy phy0 interface add wlan0mon type monitor
echo 'wlan0mon in monitor mode'
ip link set wlan0mon up
" > wlan0mon.sh
chmod +x wlan0mon.sh
sh wlan0mon.sh
