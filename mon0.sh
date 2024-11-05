#!/bin/sh

echo "
iw phy phy0 interface add mon0 type monitor
echo 'monitor mode mon0 enable'
ip link set mon0 up
" > mon.sh
chmod +x mon.sh
sh mon.sh && mdk4 mon0 d
