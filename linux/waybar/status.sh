date_formatted=$(date "+%a %F %H:%M")

if [ -f "/sys/class/power_supply/macsmc-battery/capacity" ]; then
  battery_status="$(cat /sys/class/power_supply/macsmc-battery/capacity)% 🔋"
fi 

current_volume="$(pamixer --get-volume-human) 🔊"

echo $current_volume $battery_status $date_formatted
