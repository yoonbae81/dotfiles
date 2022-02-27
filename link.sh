#!/bin/bash

ln -sf $PWD/zprofile    ~/.zprofile
ln -sf $PWD/xprofile    ~/.xprofile
ln -sf $PWD/aliases     ~/.aliases

ln -sf $PWD/vimrc       ~/.vimrc
ln -sf $PWD/wgetrc      ~/.wgetrc

mkdir -p ~/.config
ln -sf $PWD/sway        ~/.config
ln -sf $PWD/alacritty   ~/.config
ln -sf $PWD/ranger      ~/.config
ln -sf $PWD/fontconfig  ~/.config
