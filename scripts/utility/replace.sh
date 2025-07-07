#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <word_to_be_replaced> <replacement_word>"
  exit 1
fi

WORD_TO_REPLACE="$1"
REPLACEMENT_WORD="$2"

replace_except_line2() {
  local FILE="$1"
  if [ ! -f "$FILE" ]; then
    echo "File $FILE not found. Skipping..."
    return
  fi

  sed -i "2b; s/$WORD_TO_REPLACE/$REPLACEMENT_WORD/g" "$FILE"
  echo "Replaced '$WORD_TO_REPLACE' with '$REPLACEMENT_WORD' in $FILE (except flake' description)"
}

for FILE in ../../configuration.nix ../../home-manager/home.nix ../../home-manager/hyprland.nix; do
  if [ -f "$FILE" ]; then
    sed -i "s/$WORD_TO_REPLACE/$REPLACEMENT_WORD/g" "$FILE"
    echo "Replaced '$WORD_TO_REPLACE' with '$REPLACEMENT_WORD' in $FILE"
  else
    echo "File $FILE not found. Skipping..."
  fi
done

replace_except_line2 ../../flake.nix
