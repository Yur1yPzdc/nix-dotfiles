#!/bin/bash

file="/home/yuri/nixos-config/bg/last_img"

current=$(cat "$file" 2>/dev/null)

if [[ ! -f "$file" || -z "$current" || ! "$current" =~ ^[0-9]+$ ]]; then
  current=1
else 
  current=$((current + 1))

  if [[ "$current" -gt 16 ]]; then
    current=1
  fi
fi

echo "$current" > "$file"

swww img --transition-type fade --transition-duration 2.0 --transition-bezier .42,0,1,1 "/home/yuri/nixos-config/bg/${current}.png" 
