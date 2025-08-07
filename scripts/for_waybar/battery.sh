#!/bin/bash

if [ -d "/sys/class/power_supply/BAT0" ]; then
  cap=$(cat /sys/class/power_supply/BAT0/capacity)
  stat=$(cat /sys/class/power_supply/BAT0/status)
  echo "󰂂 $cap%"
else
  echo ""
fi
