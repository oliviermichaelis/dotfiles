# oliviermichaelis

# xorg keyboard settings
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap eu

# load ~/.Xresources
xrdb ~/.Xresources
# start i3
exec dbus-launch i3

