#!/bin/bash

values=(1 2 3 4 5 5 6 7 8 9)

f="$HOME/bg/.last_img"
read -n1 l < "$f"

v=$(( $l + 1 ))

if [ "$v" -eq "10" ]; then
  v=1
fi
echo $v $l

ask="$HOME/bg/$v.png"

cat > $HOME/bg/.last_img << EOF1
$v
EOF1

swww img --transition-type fade --transition-duration 2.0 --transition-bezier .42,0,1,1 $ask 
