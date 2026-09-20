{ pkgs, ...}: 

{
  nixpkgs.config.allowUnfree = true;
  imports = [ 
    ./alacritty.nix
    ./bash.nix 
    ./firefox.nix
    ./git.nix
    # ./hyprland.nix
    ./hyprlandLua.nix
    ./throne.nix
    ./waybar.nix
  ];
  
  home = {
    username = "yuri";
    homeDirectory = "/home/yuri";
    stateVersion = "25.11";
    packages = with pkgs; [
      # telegram-desktop
      # v2raya
    ];
  };
}
