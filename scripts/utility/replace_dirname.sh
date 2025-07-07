#!/bin/bash

if [ -z "$1" ] ; then
  echo "Replaces default dirname 'nixos-config' with yours\n"
  echo "Usage: $0 <new_dirname>"
  exit 1
fi

REPLACEMENT_WORD="$1"

replace_except_line2() {
  local FILE="$1"
  if [ ! -f "$FILE" ]; then
    echo "File $FILE not found. Skipping..."
    return
  fi

  sed -i "2b; s/nixos-config/$REPLACEMENT_WORD/g" "$FILE"
  echo "Replaced 'nixos-config' with '$REPLACEMENT_WORD' in $FILE (except flake' description)"
}

for FILE in ../../home-manager/bash.nix ../../bg/bg.sh ../../home-manager/hyprland.nix; do
  if [ -f "$FILE" ]; then
    sed -i "s/nixos-config/$REPLACEMENT_WORD/g" "$FILE"
    echo "Replaced 'nixos-config' with '$REPLACEMENT_WORD' in $FILE"
  else
    echo "File $FILE not found. Skipping..."
  fi
done
