#!/bin/sh
set -eu
base=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
icons=${XDG_DATA_HOME:-"$HOME/.local/share"}/icons
for theme in Vivian Vivian_umbrella; do
    destination="$icons/$theme"
    if [ -e "$destination" ] || [ -L "$destination" ]; then
        printf '%s\n' "A theme already exists at $destination. Move it aside before installing this version." >&2
        exit 1
    fi
done
mkdir -p "$icons"
for theme in Vivian Vivian_umbrella; do
    cp -R "$base/$theme" "$icons/$theme"
done
printf '%s\n' "Installed Vivian and Vivian_umbrella to $icons" "Activate: hyprctl setcursor Vivian 64" "Or: hyprctl setcursor Vivian_umbrella 64" "See README.md for persistent settings and GTK applications."
