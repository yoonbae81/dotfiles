# CLI Settings

## zsh

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) 
```
$ git clone https://aur.archlinux.org/oh-my-zsh-git.git
$ cd oh-my-zsh-git
$ makepkg -si
$ /usr/share/oh-my-zsh/tools/install.sh
```

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
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
$ echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
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
