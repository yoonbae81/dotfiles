# Raspberry Pi 4

## Wifi

Generate `/etc/wpa_supplicant/wpa_supplicant-wlan0.conf` in accordance with [Wiki](https://wiki.archlinux.org/title/Wpa_supplicant), and enable systemd units as follows:
```
# systemctl enable wpa_supplicant@wlan0
# systemctl start systemd-networkd
# systemctl start systemd-resolved
# systemctl start dhcpcd
```


### Reference
- https://wiki.archlinux.org/title/Wpa_supplicant


## Printer Sharing

Install CUPS
```
# pacman -S cups
# cupsctl --remote-admin --remote-any --share-printers
```

Configure SAMBA
```
# vi /etc/samba/smb.conf
[printers]
   browseable = yes
   guest ok = yes
```


## Torrent
```
# pacman -S transmission-cli
```
https://wiki.archlinux.org/title/transmission#Choosing_a_user


### References
- https://askubuntu.com/questions/23936/how-do-you-administer-cups-remotely-using-the-web-interface
- https://www.instructables.com/How-to-BackUp-and-Shrink-Your-Raspberry-Pi-Image/
