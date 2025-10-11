# ❄️ Yur1yPzdc' NixOS Config

## 📝 Info

- Bash shortcuts:
+ `rebuild = sudo nixos-rebuild switch --flake $HOME/nixos-config`
+ `hmswitch = home-manager switch --flake $HOME/nixos-config`
+ `v, vi, vim = nvim`
- Config size ~20G with no extra packages

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**
   
   Recommended settings:
- x86-64_linux system with UEFI boot
- Enable flakes: `nix.settings.experimental-features = [ "nix-command" "flakes" ];`
- Minimal no GUI installation
- Include packages: git (vim if youre a nano hater)
- Enable wireless internet via wpa_supplicant or use ethernet
- Create your future user, a default one
  
2. **Setup**
- Check internet connection: wired or get your wireless adapter interface name with `ip link`, create basic wpa_supplicant.conf in /etc
- Clone the repo into /home/<username>: `git clone https://github.com/Yur1yPzdc/nix-dotfiles ./nixos-config`. Directory name is changeable later
- Run `cd nixos-config` `cp /etc/nixos/hardware_configuration.nix ./hardware-configuration.nix` to insert hardware-configuration.nix file to config
- Follow 3.2 
- Run `rm -rf .git && nixos-rebuild switch --flake . && home-manager switch --flake .` to finish the install process

3. **Extras**
  
3.1 **Included shortcuts**
- `rebuild = sudo nixos-rebuild switch --flake $HOME/<dirname>`
- `hmswitch = home-manager switch --flake $HOME/<dirname>`
- `v, vi, vim = nvim`

3.2 **Modified user, directory naming, updating stateVersion, etc…**
- `cd nixos-config/scripts/utility` and `sh modify.sh`

3.5 **Remember to:**
- Create user password as root either imperatively (booo!) `passwd username` or run `mkpasswd <your password> >> nixos-config/configuration.nix`, open `configuration.nix`, edit last line to look like `hashedPassword = "<that line>";` and move it right under `extraGroups = [ "wheel" "networkmanager" "input" ];` 

## 🤝 Contributions
🎨 If you have stumbled upon great artwork that can be used as a wallpaper, i.e. following theme, feel free to recommend adding it into this config
