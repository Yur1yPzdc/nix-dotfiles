#!/bin/bash

sudo wpa_supplicant -f /dev/null -B -i wlp60s0 -c $HOME/.wifi/wpa_supplicant.conf
#sudo wpa_cli enable_network 2
#sudo wpa_cli enable_network 1
#sudo wpa_cli enable_network 0
#sudo wpa_cli disable_network 2
#sudo wpa_cli disable_network 1
#sudo wpa_cli disable_network 0

net_ans=""
a=0

while [ -z "$net_ans" ]; do
  sleep 1
  net_ans="$(ping -w 1 9.9.9.9 | grep PING)"
  a=$((a + 1))
done

echo gaysex
