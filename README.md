# ❄️ Yur1yPzdc' NixOS Config

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**
   
   Recommended settings:
- x86-64_linux system with UEFI boot ~because i hate MBR~. You can copy them from here by hand
- Enable flakes: `nix.settings.experimental-features = [ "nix-command" "flakes" ];`
- Minimal no GUI installation
- Include packages: git, vim
- Enable wireless internet via wpa_supplicant
- Create your future user, a default one.
  
2. **Setup**
- Check internet connection: wired or get your wireless adapter interface name with `ip link`, create basic wpa_supplicant.conf in /etc
- Clone the repo into /home/<username>: `git clone https://github.com/Yur1yPzdc/nix-dotfiles ./nixos-config`. Mine is `/home/yuri/nixos-config`
- Run `cd nixos-config` `cp /etc/nixos/hardware_configuration.nix ./hardware-configuration.nix` to insert hardware-configuration.nix file to config
- Replace version-related lines in `./configuration.nix` and `./home-manager/home.nix` to your installed nixos version. The one in the name of ISO you have installed

```diff
-- stateVersion = "24.05";
++ stateVersion = "<your stateVersion>";
```

- Follow 3.2 and/or 3.3
- Run `rm -rf .git && nixos-rebuild switch --flake . && home-manager switch --flake .` to finish the install process

3. **Extras**
  
  3.1 **Included shortcuts**
- `rebuild = sudo nixos-rebuild switch --flake $HOME/nixos-config`
- `hmswitch = home-manager switch --flake $HOME/nixos-config`
- `v, vi, vim = nvim`

3.2 **Creating with non-yuri user**
- Run `sh replace_username.sh` from `/scripts/utility` to see its usage. If you've chosen wrong username you can run it again to replace wrong one with a correct one.

3.3 **Creating with non-nixos-config directory**
- Run `sh replace_dirname.sh` from `/scripts/utility` to see its usage

3.4 **Creating local proxy**
- Run `nix-shell -p gcc gnumake`
- Then run `sh create_proxy.sh` from `/scripts/wifi`
- This creates `ciadpi` - a local SOCKS5 proxy server in `/scripts/wifi` which can be later run to instantiate it 
- You can exit nix-shell with `exit`. To instantiate it to work like [GoodByeDPI](https://github.com/ValdikSS/GoodbyeDPI) run `sh proxy.sh`
- **NOTE:** upon Hyprland initialization `/scripts/wifi/proxy.sh` will be executed automatically, so don't run it manually

3.5 **Remember to:**
- Create user password as root either imperatively (booo!) `passwd username` or run `mkpasswd <your password> >> nixos-config/configuration.nix`, open `configuration.nix`, edit last line to look like `hashedPassword = "<that line>";` and move it right under `extraGroups = [ "wheel" "networkmanager" "input" ];` 

## 🤝 Contributions
🎨 If you have stumbled upon great touhou-related artwork that can be used as a wallpaper feel free to recommend adding it into this config
