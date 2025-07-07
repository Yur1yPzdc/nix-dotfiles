{ config, pkgs, ...}: {

  nixpkgs.config.allowUnfree = true;
  
  home = {
    username = "yuri";
    homeDirectory = "/home/yuri";
    stateVersion = "24.05";
    packages = with pkgs; [
    ];
  };

  imports = [ 
    ./bash.nix 
    ./hyprland.nix
    ./alacritty.nix
    ./git.nix
    ./waybar.nix
    #./hyprcursor.nix
  ];

}
