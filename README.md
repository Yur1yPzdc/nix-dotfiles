# Instruction for installation
! note: do the steps below *after* installing any (minimal i guess) nixos 64 bit system 
!MAKE SURE you installed git or run ` nix-shell -p git ` 
ALSO! make sure you have internet connection (wired = automatically; wireless -> configure wpa_supplicant and wpa_cli)
1. Clone this repository into your future nixos config folder. Mine is ~/nixos-config (from here now it is nixos-config)
2. Insert your hardware-configuration.nix to nixos-config
3. Depending on how you managed your disk boot partition, copy boot-related lines from the configuration in /etc/nixos into this one. Those have worked on my first machine
4. Run ` nixos-rebuild switch `. This one is for enabling flakes
5. Run ` nixos-rebuild switch --flake ~/nixos-config && home-manager switch --flake ~/nixos-config ` 
6. To enable proxy (for russians) for browser and discord run ` nix-shell -p gnumake gcc `, then ` mkdir proxy && git clone https://github.com/hufrea/byedpi.git ./proxy && cd proxy && make `, then ` cp ciadpi ../ciadpi && cd .. && rm -rf proxy `. To actually enable it run run.sh (port 1080)
7. (TODO: stuff with waybar and eww)


# TODO
- [ ] rewrite and refactor eww folder and box to actually work
- [ ] rewrite waybar (battery not visible if not laptop => pizdec)
