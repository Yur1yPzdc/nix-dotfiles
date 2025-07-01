# Instruction for installation
! note: do the steps below *after* installing any (minimal i guess) nixos 64 bit system
1. Clone this repository into your future nixos config folder. Mine is ~/nixos-config (from here now it is nixos-config)
2. Insert your hardware-configuration.nix to nixos-config
3. Depending on how you managed your disk boot partition, copy boot-related lines from the configuration in /etc/nixos into this one. Those have worked on my first machine
4. Run ' nixos-rebuild switch '. This one is for enabling flakes
5. Run ' nixos-rebuild switch --flake ~/nixos-config && home-manager switch --flake ~/nixos-config ' 
6. (TODO: refactor the repo scripts and bg folders)
7. To enable proxy (for russians) for browser and discord run ' nix-shell -p gnumake gcc ', then ' cd scripts/wifi/proxy && make ', then ' cp ciadpi ../ciadpi && cd .. && rm -rf proxy'. To actually enable it run run.sh (port 1080)
8. (TODO: stuff with waybar and eww)


# TODO
[] refactor repo folder structure to better automate install process
[] remake ciadpi compiling script to compile into previous folder
[] understand proxy usage in configuration.nix
[] resolve the warning about nixvim 
[] rewrite and refactor eww folder and box to actually work
[] rewrite waybar (battery not visible if not laptop => pizdec)
