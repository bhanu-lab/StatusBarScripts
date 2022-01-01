#!/bin/bash

bat_cap=$(acpi -V | grep capacity | awk -F ":" '{ print $2 }' | awk -F "," '{ print $1 }')
last_cap=$(acpi -V | grep capacity | awk -F ":" '{ print $2 }' | awk -F "," '{ print $2 }' | awk -F "=" '{ print $1 }')
info=$(acpi | awk -F "," '{ print $3 }')
state=$( acpi | awk -F ":" '{ print $2 }' | awk -F "," '{ print $1 }' )
value=$( acpi | awk -F ":" '{ print $2 }' | awk -F "," '{ print $2 }' | sed s/%//g )
icon=""

if [[ "${state//[[:space:]]}" == "Discharging" ]]; then
    if [ ${value} -le 10 ]; then
	icon="/home/bhanureddy/Pictures/icons/icons8-low-battery-64.png"
    else
	echo "in else block"
	icon="/home/bhanureddy/Pictures/icons/icons8-charged-battery-64.png"
    fi
elif [ "${state//[[:space:]]}" = "Charging" ]; then
    icon="/home/bhanureddy/Pictures/icons/icons8-charging-battery-64.png"
else 
    echo "not expeccted to be here"
fi

notify-send -t 5000 --icon="$icon" "BATTERY STATS" "\n $info \n CAPACITY: $bat_cap \n LAST_CAP: $last_cap"

