# CLI Settings

## zsh

- [oh-my-zsh](https://aur.archlinux.org/packages/oh-my-zsh-git) 
```
$ git clone https://aur.archlinux.org/oh-my-zsh-git.git
$ cd oh-my-zsh-git
$ makepkg -si
```

- [powerlevel10k](https://aur.archlinux.org/packages/zsh-theme-powerlevel10k-git)
```
$ git clone https://aur.archlinux.org/zsh-theme-powerlevel10k-git.git
$ cd zsh-theme-powerlevel10k-git
$ makepkg -si
```
- [Meslo font](https://aur.archlinux.org/packages/ttf-meslo-nerd-font-powerlevel10k)
```
$ git clone https://aur.archlinux.org/ttf-meslo-nerd-font-powerlevel10k.git
$ cd ttf-meslo-nerd-font-powerlevel10k
$ makepkg -si
```

## [ranger](https://wiki.archlinux.org/title/ranger)
ranger is a text-based file manager written in Python with vi-style key bindings.

```
$ pacman -S ranger
$ ranger --copy-config=all
```

Show hidden file
```
:set show_hidden true
```
