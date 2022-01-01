#!/bin/bash

dat="$(date '+%A, %B %d, %Y')"
week="$(date '+%U')"
UTC="$(date '+%s')"
notify-send -t 5000 --icon=/home/bhanureddy/Pictures/icons/icons8-schedule-64.png "FULL DATE" "\n WEEK: $week \n $dat \n UTC: $UTC"
