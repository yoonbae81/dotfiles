# Arch Linux Installation

## Preparation

### Boot with installation USB

- [Download](https://archlinux.org/download/) iso file
- Create bootable USB drives using [Rufus](https://rufus.ie/en/), which helps format and create bootable USB drive.
  - Or, just copy the iso file into [Ventoy](https://www.ventoy.net/), which creates bootable USB drive.

### Prepare partition

Assume ESP (EFI System Partition) is already located and will be shared with the other operating systems.

```
# fdisk /dev/nvme0n1

# mkfs.ext4 -j /dev/nvme0n1p5
# mount /dev/nvme0n1p5 /mnt
# mkdir /mnt/boot
# mount /dev/nvme0n1p1 /mnt/boot
```


## Installation

### Connect to WIFI

Confirm the device name: wlan0
```
# systemctl start iwd
# iwctl
[iwd]# device list
```

Scan wireless network and connect to it.
```
[iwd]# station wlan0 scan
[iwd]# station wlan0 get-networks
---------------------------------------
 Network name     Security      Signal
---------------------------------------
 *ESSID*          psk           ****

[iwd]# station wlan0 connectl *ESSID*
Type the network passphrase for *ESSID*psk.
Passphrase:

[iwd]# exit
```

Save configuration to permanant location without passphrase for security.

```
# mkdir -p /mnt/var/lib/iwd
# sed '/^Passphrase=/d' /var/lib/iwd/ESSID.psk > /mnt/var/lib/iwd/ESSID.psk
```

### Install base packages

```
# pacstrap /mnt base linux linux-firmware intel-ucode iwd dhcpcd base-devel man-db man-pages zsh vim
# genfstab -U /mnt >> /mnt/etc/fstab
```

## Setting

### Change the root directory

Finally, base packages were installed, so let's enter into the system. The following command makes /mnt as /.
```
# arch-chroot /mnt
```

### Add an user who can use sudo

Set password for root
```
# passwd
```

```
# useradd -m -g users -G wheel -s /bin/zsh [USER]
# passwd [USER]
# visudo
```

Uncomment one of line below of your choice.
```
### Uncomment to allow members of group wheel to execute any command
# %wheel ALL=(ALL) ALL

### Same thing without a password
# %wheel ALL=(ALL) NOPASSWD: ALL
```

### Set locale and timezone
```
# echo LANG=en_US.UTF-8 > /etc/locale.conf
# echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
# locale-gen
# ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
```

### Synchronize the system clock across the network

Uncomment the following lines in /etc/systemd/timesyncd.conf
```
NTP=
FallbackNTP=0.arch.pool.ntp.org ...
```

```
# systemctl enable systemd-timesyncd
```

### Set network related services

```
# echo HOSTNAME > /etc/hostname
# systemctl enable dhcpcd iwd systemd-networkd systemd-resolved
```



## For the first boot

### Install bootloader

```
# bootctl --path=/boot install

# vim /boot/loader/loader.conf
# cat > /boot/loader/loader.conf << EOF
> default arch
> timeout 3
> EOF

# cat > /mnt/boot/loader/entries/arch.conf << EOF
> title Arch Linux
> linux /vmlinuz-linux
> initrd /intel-ucode.img
> initrd /initramfs-linux.img
> options root=/dev/nvme0n1p1 init=/usr/lib/systemd/systemd rw quiet
> EOF
```

### Reboot
```
# exit
```
NTP=
FallbackNTP=0.arch.pool.ntp.org ...
```
# umount -lR /mnt
# reboot
```


## References

- https://jeonwh.com/arch-install/
- https://sudaraka.org/how-to/chromebook-r11-archlinux-installation-guide/
