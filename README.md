# ❄️ Yur1yPzdc' NixOS Config

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**
   
   Recommended settings:
- x86-64_linux system with UEFI boot ~because i hate MBR~
- minimal no GUI installation
- Included packages: git, vim
- Enable wireless internet via wpa_supplicant
- Create your future user, a default one. Either name it `yuri` or as you want, but follow 2 then. Or you can run in from root, so make a temp folder then

2. **NOTE**
- The only user that will be on the system is `yuri`. Follow 4.2 to remake it to your user

3. **Setup**
- Clone the repo: `git clone https://github.com/Yur1yPzdc/nix-dotfiles ./nixos-config`. Mine is `/home/yuri/nixos-config`. To rename it to yours follow 4.3
- Run `cd nixos-config` `cp /etc/nixos/hardware_configuration.nix ./hardware-configuration.nix` to insert hardware-configuration.nix file to config
- Replace version-related lines in `./configuration.nix` and `./home-manager/home.nix` to your installed nixos version. The one in the name of ISO you have installed

```diff
-- stateVersion = "24.05";
++ stateVersion = "<your stateVersion>";
```

- Run `rm -rf .git && nixos-rebuild switch --flake . && home-manager switch --flake .` to finish the install process

4. **Extras**
  
  4.1 **Included shortcuts**
- `rebuild = sudo nixos-rebuild switch --flake $HOME/nixos-config`
- `hmswitch = home-manager switch --flake $HOME/nixos-config`
- `v, vi, vim = nvim`

4.2 **Creating with non-yuri user**
- Run `sh replace_username.sh` from `/scripts/utility` to see its usage. If you've chosen wrong username you can run it again to replace wrong one with a correct one.

4.3 **Creating with non-nixos-config directory**
- Run `sh replace_dirname.sh` from `/scripts/utility` to see its usage

4.4 **Creating local proxy**
- Run `nix-shell -p gcc gnumake`
- Then run `sh create_proxy.sh` from `/scripts/wifi`
- This creates `ciadpi` - a local SOCKS5 proxy server in `/scripts/wifi` which can be later run to instantiate it 
- You can exit nix-shell with `exit`. To instantiate it to work like [GoodByeDPI](https://github.com/ValdikSS/GoodbyeDPI) run `sh proxy.sh`
- **NOTE:** upon Hyprland initialization `/scripts/wifi/proxy.sh` will be executed automatically, so don't run it manually

4.5 **Remember to:**
- Create user password as root either imperatively (booo!) `passwd username` or run `mkpasswd <your password> >> nixos-config/configuration.nix`, open `configuration.nix`, edit last line to look like `hashedPassword = "<that line>";` and move it right under `extraGroups = [ "wheel" "networkmanager" "input" ];` 

## 🤝 Contributions
🎨 If you have stumbled upon great touhou-related artwork that can be used as a wallpaper feel free to recommend adding it into this config
