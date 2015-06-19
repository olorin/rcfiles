nitrogen --restore
sh $HOME/.screenlayout/main.sh
setxkbmap -option '+compose(prsc)'
xmodmap $HOME/.keymap
xmobar &
exec xmonad
