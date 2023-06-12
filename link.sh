#!/bin/bash

ln -sf $PWD/bash_profile ~/.bash_profile
ln -sf $PWD/aliases     ~/.aliases
ln -sf $PWD/wgetrc      ~/.wgetrc

mkdir -p ~/.config
ln -sf $PWD/nvim	    ~/.config
ln -sf $PWD/fish 	    ~/.config
ln -sf $PWD/alacritty   ~/.config
ln -sf $PWD/ranger      ~/.config
ln -sf $PWD/fontconfig  ~/.config

#mkdir -p ~/.local/share/applications
#ln -sf $PWD/wofi/shortcuts ~/.local/share/applications

#mkdir -p ~/.local/share/
#ln -sf $PWD/fonts ~/.local/share
