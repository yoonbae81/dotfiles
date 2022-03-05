# Raspberry Pi 4

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
