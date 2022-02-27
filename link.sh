dir=$PWD

ln -sf $PWD/zprofile    ~/.zprofile
ln -sf $PWD/xprofile    ~/.xprofile
ln -sf $PWD/aliases     ~/.aliases

ln -sf $PWD/vimrc       ~/.vimrc
ln -sf $PWD/wgetrc      ~/.wgetrc

mkdir ~/.config
ln -sf $PWD/sway        ~/.config/sway 
