#!/bin/bash

local_ip=$(hostname -I | awk '{ print $1 }')
ext_ip=$(dig +short myip.opendns.com @resolver4.opendns.com)
gate_way=$(ip r | grep default | awk '{ print $3 }')


val=`echo "LOCAL: $local_ip \n EXTERN: $ext_ip \n GATEW: $gate_way"`
notify-send -t 5000 --icon=/home/bhanureddy/Pictures/icons/icons8-wi-fi-64.png -u normal "NETWORK INFO" " $val"
