# Arch Linux GUI package installation

## Wayland

Wayland is a display server protocol and the potential successor of the X Window System, specially [Xorg](https://wiki.archlinux.org/title/Xorg).

### Installation

```
$ sudo pacman -S wayland xorg-xwayland
```
Note that XWayland provides backwards compatibility for applications that still don't suport Wayland.



## Compositor: [Sway](https://github.com/swaywm/sway), tiling compositor

```
$ sudo pacman -S sway alacritty waybar wofi
```

### Remap CapsLock as Ctrl
```
#!/bin/bash
export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
sway
```

## Browser

```
$ sudo pacman -S firefox jack2 noto-fonts noto-fonts-cjk

```



## Korean IME

### [KIME](https://aur.archlinux.org/packages/kime)

```
$ git clone https://aur.archlinux.org/kime.git
$ cd kime
$ makepkg -si
$ sudo cp /usr/share/doc/kime/default_config.yaml /etc/xdg/kime/config.yaml
```


## Install graphic drivers for Xorg (if necessary)

### Find what I have
```
# lspci | grep -A1 -e VGA -e 3D
# sudo pacman -S xf86-video-intel
```


## References

- https://www.fosskers.ca/en/blog/wayland
