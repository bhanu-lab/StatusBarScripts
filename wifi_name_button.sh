#!/bin/bash

local_ip=$(hostname -I | awk '{ print $1 }')
ext_ip=$(dig +short myip.opendns.com @resolver4.opendns.com)
gate_way=$(ip r | grep default | awk '{ print $3 }')


URL="http://ip-api.com/json/"
val=$(curl $(echo $URL$ext_ip) | jq --jsonargs '.country, .regionName, .city, .lat, .lon, .isp' | tr '\n' '-')
lat=$(echo $val | awk -F "-" '{ print $4}')
long=$(echo $val | awk -F "-" '{ print $5}')
country=$(echo $val | awk -F "-" '{ print $1}' | sed s/\"//g )
region=$(echo $val | awk -F "-" '{ print $2}' | sed s/\"//g )
city=$(echo $val | awk -F "-" '{ print $3}' | sed s/\"//g )
isp=$(echo $val | awk -F "-" '{ print $6}' | sed s/\"//g )

map_link=$(echo "https://maps.google.com/?q=$lat,$long")
not=`echo "LOCAL: $local_ip \n EXTERN: $ext_ip \n GATEW: $gate_way \n ADDR: $city, $region, $country \n ISP:$isp \n Map: $map_link"`
notify-send -t 5000 --icon=/home/bhanureddy/Pictures/icons/icons8-wi-fi-64.png -u normal "NETWORK INFO" "$not"
