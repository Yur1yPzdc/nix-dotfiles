# ❄️ Yur1yPzdc' NixOS Config

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS** Recommended settings:
- x86-64_linux system with UEFI boot ~because i hate MBR~
- minimal no GUI installation
- Included packages: git, vim
- Enable wireless internet via wpa_supplicant
- Create your future user, a default one

2. **NOTE**
- The only user that will be on the system is `yuri`. Follow 4.2 to remake it to your user

3. **Setup**
- Clone the repo into your future config directory: `git clone https://github.com/Yur1yPzdc/nix-dotfiles [name of your directory]`. Mine is `nixos-config`
- Run `cp /etc/hardware_configuration.nix [your directory name]/hardware_configuration.nix` to insert hardware_configuration.nix file to config
- Replace version-related lines in `configuration.nix` and `/home-manager/home.nix` to your installed nixos version. The one in the name of ISO
```diff
-- stateVersion = "24.05";
++ stateVersion = "[your stateVersion]";
```
- Run `sudo nixos-rebuild switch --experimental-features 'nix-command flakes'` to enable flakes
- Run `nixos-rebuild switch --flake ~/nixos-config && home-manager switch --flake ~/nixos-config` to finish the install process

4. **Extras**
  
  4.1 **Included shortcuts**
- `rebuild = sudo nixos-rebuild switch --flake $HOME/[your directory name]`
- `hmswitch = home-manager switch --flake $HOME/[your directory name]`
- `v, vi, vim = nvim`

  4.2 **Creating with non-yuri user**
- Rename all of those listed below. Easier done with vim hotkeys: `:%s/yuri/username/g`
`configuration.nix`
```diff
-- configFile.path = "/home/yuri/scripts/wifi/wpa_supplicant.nix";
++ configFile.path = "/home/username/scripts/wifi/wpa_supplicant.nix";

-- users.users.yuri = {
++ users.users.username = {

-- services.getty.autoLoginUser = "yuri";
++ services.getty.autoLoginUser = "username";
```

`/home-manager/home.nix`
```diff
-- username = "yuri";
++ username = "username";

-- homeDirectory = "/home/yuri";
++ homeDirectory = "/home/username";
```

`flake.nix`
```diff
-- homeConfigurations.yuri = home-manager.lib.homeManagerConfiguration {
++ homeConfigurations.username = home-manager.lib.homeManagerConfiguration {
```

`hyprland.nix`
```diff
-- "$secMod,  B, exec, sh /home/yuri/bg/bg.sh"
++ "$secMod,  B, exec, sh /home/username/bg/bg.sh"
```

  4.3 **Creating local proxy**
- Run `nix-shell -p gcc gnumake`
- Then run `sh create_proxy.sh` from `/scripts/wifi`
- This creates `ciadpi` - a local SOCKS5 proxy server in `/scripts/wifi' which can be later run to instantiate it 
- You can exit nix-shell with `exit`. To instantiate it to work like [GoodByeDPI](https://github.com/ValdikSS/GoodbyeDPI) run `sh proxy.sh`
- **NOTE:** upon Hyprland initialization `/scripts/wifi/proxy.sh` will be executed automatically, so don't run it manually
