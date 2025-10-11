#!/bin/bash

echo "Install customizer master"
echo "========================="

echo "1. Your user name:"
read username
for FILE in ../../configuration.nix ../../home-manager/home.nix ../../home-manager/hyprland.nix ../../flake.nix ../../bg/bg.sh ../../home-manager/waybar.nix; do
  if [ -f "$FILE" ]; then
    sed -i "s/yuri/$username/g" "$FILE"
  else
    echo "File $FILE not found. Skipping..."
  fi
done

echo "2. Your config directory name:"
read dirname
for FILE in ../../configuration.nix ../../bg/bg.sh ../../home-manager/bash.nix ../../home-manager/hyprland.nix ../../home-manager/waybar.nix; do
  if [ -f "$FILE" ]; then
    sed -i "s/nixos-config/$dirname/g" "$FILE"
  else
    echo "File $FILE not found. Skipping..."
  fi
done

echo "3. Your user password: (invisible for security reasons)"
read -r -s password
hpass=$(mkpasswd "$password")
hpass_escaped=$(echo "$hpass" | sed 's/[\/&]/\\&/g')
sed -i "s/hashedPassword = .*/hashedPassword = \"$hpass_escaped\";/" ../../configuration.nix

echo "4. Your timezone:"
read tz
for FILE in ../../configuration.nix ../../home-manager/waybar.nix; do
  if [ -f "$FILE" ]; then
    sed -i "s/nixos-config/$tz/g" "$FILE"
  else
    echo "File $FILE not found. Skipping..."
  fi
done

echo "5. Your stateVersion:"
read sv
sed -i "s/system.stateVersion = .*/system.stateVersion = \"$sv\"; # Did you read the comment?/" ../../configuration.nix

echo "6. Your wifi interface (ip link command tells it; better call it in tty2)"
read wi
sed -i "s/interfaces = .*/interfaces = [ \"$wi\" ];/" ../../configuration.nix

echo "Customization process finished"
