xmodmap -e "keycode 94 = ISO_Level3_Shift"
setxkbmap -option caps:escape &
xset r rate 200 30
xset -dpms
exec i3
