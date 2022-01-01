#!/bin/sh
ICON=""
read -r capacity </sys/class/power_supply/BAT0/capacity
#printf "$ICON%s%%" "$capacity"

bat=$(acpi | awk  '{ print $3 ":" $4 }' | sed s/,//g | sed s/Discharging/D/g | sed s/Charging/C/g)
echo $bat
