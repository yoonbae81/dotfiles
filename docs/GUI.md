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
$ sudo pacman -S sway swayidle alacritty waybar wofi
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


## Screenshot
```
# pacman -S slurp grim imv
```



## Korean IME

### [KIME](https://aur.archlinux.org/packages/kime)

```
$ git clone https://aur.archlinux.org/kime.git
$ cd kime
$ makepkg -si
$ sudo mkdir -p /etc/xdg/kime
$ sudo cp /usr/share/doc/kime/default_config.yaml /etc/xdg/kime/config.yaml
```

## Clipboard

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

## Install graphic drivers for Xorg (if necessary)

### Find what I have
```
# lspci | grep -A1 -e VGA -e 3D
# sudo pacman -S xf86-video-intel
```


## References

- https://www.fosskers.ca/en/blog/wayland
- https://grimoire.science/working-with-wayland-and-sway/ 
