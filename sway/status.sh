date_formatted=$(date "+%a %F %H:%M")
battery_status="$(cat /sys/class/power_supply/macsmc-battery/capacity)%"

echo $battery_status 🔋 $date_formatted
