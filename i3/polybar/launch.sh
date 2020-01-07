#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

xrandr --query | grep ' connected' | awk '{print $1}' | while read monitor
do
    MONITOR=${monitor} polybar --config="/home/kurari/.config/polybar/config" top &
done
MONITOR=DP2 polybar --config="/home/kurari/.config/polybar/config" statusbar &
#MONITOR=eDP1 polybar --config="/home/kurari/.config/polybar/config" statusbar &

echo "Polybar Launched..."
