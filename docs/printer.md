# Printer Sharing

## CUPS
```
# pacman -S cups
# cupsctl --remote-admin --remote-any --share-printers
```


## Samba
```
# vi /etc/samba/smb.conf
[printers]
   browseable = yes
   guest ok = yes
```

### References
- https://askubuntu.com/questions/23936/how-do-you-administer-cups-remotely-using-the-web-interface
