#!/bin/bash

#run as online 2> /dev/null to digest errors

v=$(ping -c 1 8.8.8.8 2>&1 > /dev/stdout | grep 'Network is unreachable')
#echo $v
p=$(ping -c 1 8.8.8.8 | grep '100% packet loss' )
#echo $p

if [[ $v != "" ]]; then
    echo "Offline"
elif [[ $p != "" ]]; then
    echo "Offline"
else
    echo "Online"
fi
