#!/bin/bash

sudo wpa_supplicant -f /dev/null -B -i wlp60s0 -c $HOME/.wifi/wpa_supplicant.conf

net_ans=""
a=0

while [ -z "$net_ans" ]; do
  sleep 1
  net_ans="$(ping -w 1 9.9.9.9 | grep PING)"
  a=$((a + 1))
done

echo gaysex
