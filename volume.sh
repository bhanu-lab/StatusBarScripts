#!/bin/bash

muted=$( pacmd list-sinks | grep muted  | awk -F ":" '{print $2}' )
#echo "value of volume is $muted"
if [[ "${muted//[[:space:]]}" == "no" ]]; then
    #echo "in if block"
    vol=$( pacmd list-sinks | grep front-left | awk -F "/" '{print $2}' )
    echo "V:${vol//[[:space:]]}"
else
    #echo "in else block"
    echo "V:Mute"
fi
