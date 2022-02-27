xlrandr --output DP2 --right-of DP1 --auto
setxkbmap -option ctrl:nocaps
xrdb -merge ~/.Xdefaults

exec sway
