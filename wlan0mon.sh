#!/bin/sh

cat > wlan0mon << EOF
iw phy phy0 interface add wlan0mon type monitor
echo "wlan0mon monitor mode enabled"
ip link set wlan0mon up
EOF
chmod +x wlan0mon
sh wlan0mon
