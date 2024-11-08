#!/bin/sh

echo "
iw phy phy0 interface add mon0 type monitor
echo 'mon0 in monitor mode'
ip link set mon0 up
" > mon0.sh
chmod +x mon0.sh
sh mon0.sh
