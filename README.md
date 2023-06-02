# Pre-Installation

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

### Connect to WIFI
https://wiki.archlinux.org/title/Iwd#iwctl

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

[iwd]# station wlan0 connect *ESSID*
Type the network passphrase for *ESSID*psk.
Passphrase:

[iwd]# exit
```

Save configuration to permanant location without passphrase for security.
```
# mkdir -p /mnt/var/lib/iwd
# sed '/^Passphrase=/d' /var/lib/iwd/ESSID.psk > /mnt/var/lib/iwd/ESSID.psk
```


# Installation

### Enable parallel downloads
`ParallelDownloads` under `[options]` needs to be set to a positive integer in `/etc/pacman.conf` to use this feature (e.g., `5`). Packages will otherwise be downloaded sequentially if this option is unset.

### Install base packages
```
# pacstrap /mnt base base-devel linux linux-firmware
# pacstrap /mnt iwd dhcpcd fish neovim
# pacstrap /mnt man-db man-pages 
# pacstrap /mnt intel-ucode
# pacstrap /mnt amd-ucode

# genfstab -U /mnt >> /mnt/etc/fstab
```

### Change the root directory
Finally, base packages were installed, so let's enter into the system. The following command makes /mnt as /.
```
# arch-chroot /mnt
```

### Add an user who can use sudo
```
# passwd
# useradd -m -g users -G wheel -s /bin/fish [USER]
# passwd [USER]
# visudo
```

Uncomment one of lines below of your choice.
```
# %wheel ALL=(ALL) ALL
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
> options root=/dev/disk/by-PARTUUID/[PARTUUID] init=/usr/lib/systemd/systemd rw quiet
> EOF
```

### Reboot
```
# exit
# reboot
```


# Post-Installation

## GUI

### Install Wayland
```shell
$ sudo pacman -S wayland xorg-xwayland polkit qt5-wayland
```
- [xorg-xwayland](https://archlinux.org/packages/extra/x86_64/xorg-xwayland/) provides backwards compatibility for applications that still don't suport Wayland.
- [qt5-wayland](https://archlinux.org/packages/extra/x86_64/qt5-wayland/) enables QT5 applications to run on Wayland.

### Install Sway
```shell
$ sudo pacman -S sway swaylock swaybg swayidle alacritty waybar wofi
```

### Install fonts
```shell
$ sudo pacman -S noto-fonts noto-fonts-cjk ttf-jetbrains-mono-nerd ttf-roboto otf-font-awesome 
```

### [Running GUI applications as root](https://wiki.archlinux.org/title/Running_GUI_applications_as_root#Wayland)
```shell
$ sudo pacman -S xorg-xhost
$ xhost si:localhost:root
```

## Hardware

### Graphics
```shell
$ lspci | grep -A1 -e VGA -e 3D
$ sudo pacman -S xf86-video-intel
$ sudo pacman -S xf86-video-amdgpu
```

### Audio
```shell
$ sudo pacman -S alsa-utils pulseaudio-alsa
```


## Applications

### AUR Helper
```
$ git clone https://aur.archlinux.org/yay-bin.git
$ cd yay-bin
$ makepkg -si
```

### AUR packages
```
$ yay -S visual-studio-code-bin
$ yay -S microsoft-edge-stable-bin
```

### Screenshot
```
# pacman -S slurp grim imv
```

### [KIME, Korean IME](https://aur.archlinux.org/packages/kime)
```
$ git clone https://aur.archlinux.org/kime.git
$ cd kime
$ makepkg -si
$ sudo mkdir -p /etc/xdg/kime
$ sudo cp /usr/share/doc/kime/default_config.yaml /etc/xdg/kime/config.yaml
```

### Clipboard
[wl-clipboard](https://github.com/bugaevc/wl-clipboard) lets let you easily copy data between the clipboard and Unix pipes, sockets, files and so on.
```
$ sudo pacman -S wl-clipboard

# copy a simple text message
$ wl-copy Hello world!

# copy the list of files in Downloads
$ ls ~/Downloads | wl-copy

# copy an image file
$ wl-copy < ~/Pictures/photo.png

# paste to a file
$ wl-paste > clipboard.txt

# grep each pasted word in file source.c
$ for word in $(wl-paste); do grep $word source.c; done

# copy the previous command
$ wl-copy "!!"

# replace the current selection with the list of types it's offered in
$ wl-paste --list-types | wl-copy
```

## Github

### [Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
```shell
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```

### [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
To configure your account on GitHub.com to use your new (or existing) SSH key, you'll also need to add the key to your account.

## Setting NFS

### Basic assumptions
- The NFS root is `/srv/nfs`.
- A share is located in `/etc/exports.d`.

### Server
- Add directories exported to NFS clients and use `exportfs -arv` to reload.
```
# /etc/exports
/src/nfs       192.168.0.0/24(rw,sync,crossmnt,fsid=0)
/src/nfs/home  192.168.0.0/24(rw,sync)
```
```
# /etc/fstab
/home/y   /srv/nfs/home  none   bind   0   0
```

- To view the current loaded exports
```
# exportfs -v
```

- Enable Service
```
# systemctl enable nfs-server
# systemctl start nfs-server
```

### Client
Prepare a directory to mount the exported.
```
# mkdir -p /mnt/[SERVER]
```

Add mount options in `/etc/fstab`
```
# /etc/fstab
pi:/	/mnt/pi     nfs     noauto,noexec,rw,sync,user,noatime,nodiratime,timeo=900,retrans=5,_netdev 0 0
hp:/	/mnt/hp     nfs     noauto,noexec,rw,sync,user,noatime,nodiratime,timeo=900,retrans=5,_netdev 0 0
mx:/	/mnt/mx     nfs     noauto,noexec,rw,sync,user,noatime,nodiratime,timeo=900,retrans=5,_netdev 0 0
```

Mount 
```
# mount [SERVER]:/ /mnt/[SERVER]
```
