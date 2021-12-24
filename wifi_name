#!/bin/bash


name=$(iwconfig | grep ESSID | awk -F ":" '{ print $2 }' | sed 's/"//g')
echo $name
