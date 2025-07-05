# ❄️ Yur1yPzdc' NixOS Config

# 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS** Recommended settings:
- x86-64_linux system with UEFI boot ~because i hate MBR~
- minimal no GUI installation
- Included packages: git, vim
- Enable wireless internet via wpa_supplicant
- Create your future user, a default one

2. **NOTE**
- The only user that will be on the system is `yuri`. Follow 5.1 to remake it to your user

3. **Setup**
- Clone the repo into your future config directory: `git clone https://github.com/Yur1yPzdc/nix-dotfiles [name of your directory]`. Mine is `nixos-config`
- Run `cp /etc/hardware_configuration.nix [your directory name]/hardware_configuration.nix` to insert hardware_configuration.nix file to config
- Replace version-related lines in `configuration.nix` and `flake.nix` to your installed nixos version
- Run `sudo nixos-rebuild switch --experimental-features 'nix-command flakes'` to enable flakes
- Run `nixos-rebuild switch --flake ~/nixos-config && home-manager switch --flake ~/nixos-config` to finish the install process

4. **Extras**
4.1 **Included shortcuts**
- `rebuild = sudo nixos-rebuild switch --flake $HOME/[your directory name]`
- `hmswitch = home-manager switch --flake $HOME/[your directory name]`
- `v, vi, vim, nvim = nixvim`
4.2 **Creating with non-yuri user**
4.3 **Creating local proxy**

# Other stuff

To enable proxy (for russians) for browser and discord run ` nix-shell -p gnumake gcc `, then ` mkdir proxy && git clone https://github.com/hufrea/byedpi.git ./proxy && cd proxy && make `, then ` cp ciadpi ../ciadpi && cd .. && rm -rf proxy `. To actually enable it run run.sh (port 1080)
(TODO: stuff with waybar and eww)

# TODO
- [ ] rewrite and refactor eww folder and box to actually work
- [ ] rewrite waybar (battery not visible if not laptop => pizdec)



