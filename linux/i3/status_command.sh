while :
do
  date_formatted=$(date "+%a %F %H:%M")
  current_volume="$(pamixer --get-volume-human) 🔊"

  echo $current_volume $battery_status $date_formatted " "
  sleep 5
done

