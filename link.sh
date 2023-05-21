#!/bin/bash

ln -sf $PWD/bash_profile ~/.bash_profile
ln -sf $PWD/zprofile    ~/.zprofile
ln -sf $PWD/xprofile    ~/.xprofile
ln -sf $PWD/aliases     ~/.aliases
ln -sf $PWD/wgetrc      ~/.wgetrc

mkdir -p ~/.config
ln -sf $PWD/nvim	    ~/.config
ln -sf $PWD/fish 	    ~/.config
ln -sf $PWD/sway        ~/.config
ln -sf $PWD/wofi        ~/.config
ln -sf $PWD/waybar      ~/.config
ln -sf $PWD/alacritty   ~/.config
ln -sf $PWD/ranger      ~/.config
ln -sf $PWD/fontconfig  ~/.config

cp $PWD/electron-flags.conf ~/.config
cp $PWD/code-flags.conf ~/.config

mkdir -p ~/.config/Code/User
cp $PWD/Code/User/* ~/.config/Code/User 

mkdir -p ~/.local/share/applications
ln -sf $PWD/wofi/shortcuts ~/.local/share/applications

mkdir -p ~/.local/share/
ln -sf $PWD/fonts ~/.local/share
