dir=$PWD

ln -sf $PWD/zprofile    ~/.zprofile
ln -sf $PWD/vimrc       ~/.vimrc
ln -sf $PWD/wgetrc      ~/.wgetrc

mkdir ~/.config
ln -sf $PWD/sway        ~/.config/sway 
