wallpaper="$(pwd)/$(ls -p | grep -v / | shuf -n 1)"
swaymsg "output * background $wallpaper fill"
