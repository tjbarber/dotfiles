# work in progress that I just haven't gotten around to finishing
wallpaper="$(pwd)/$(ls -p | grep -v / | shuf -n 1)"
swaymsg "output * background $wallpaper fill"
