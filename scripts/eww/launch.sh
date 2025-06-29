#!/bin/bash

a="$(sh $HOME/.wifi/wifi.sh | grep gaysex)"

sh $HOME/.wifi/run.sh

echo $a

eww daemon --config ~/.config/eww/wifi/popup
eww open wifi_popup --toggle --config ~/.config/eww/wifi/popup
