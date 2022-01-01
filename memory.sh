#!/bin/bash

mem=$(df -h /dev/sda5 | sed -n '1!p' | awk '{print $4}')
echo $mem
