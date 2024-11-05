#!/bin/sh
echo 'mon0 monitor mode enable'
iw phy phy0 interface add mon0 type monitor
ip link set mon0 up
airodump-ng mon0
