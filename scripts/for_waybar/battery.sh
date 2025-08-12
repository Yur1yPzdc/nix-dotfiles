#!/bin/bash

if [ -d "/sys/class/power_supply/BAT0" ]; then
  cap=$(cat /sys/class/power_supply/BAT0/capacity)
  stat=$(cat /sys/class/power_supply/BAT0/status)
  case "$stat" in
    "Charging")
      echo "󱊦 $cap%" 
      ;;
    "Discharging")
      echo "󰂌 $cap%"
      ;;
    "Full")
      echo "󰁹 $cap%"
      ;;
    "Unknown")
      echo "󰂑 $cap%" 
      ;;
    *)
      echo "󰁿 $cap%" 
      ;;
  esac 
else
  echo ""
fi
