#!/bin/bash

ln -sf $PWD/zprofile    ~/.zprofile
ln -sf $PWD/xprofile    ~/.xprofile
ln -sf $PWD/aliases     ~/.aliases

ln -sf $PWD/vimrc       ~/.vimrc
ln -sf $PWD/wgetrc      ~/.wgetrc

mkdir -p ~/.config
ln -sf $PWD/sway        ~/.config/sway
ln -sf $PWD/ranger      ~/.config/ranger
ln -sf $PWD/fontconfig  ~/.config/fontconfig
