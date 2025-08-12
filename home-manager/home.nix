{ config, pkgs, ...}: {

  nixpkgs.config.allowUnfree = true;
  
  home = {
    username = "yuri";
    homeDirectory = "/home/yuri";
    stateVersion = "24.05";
    packages = with pkgs; [
      telegram-desktop
      litemdview
      dorion
    ];
  };

  imports = [ 
    ./alacritty.nix
    ./bash.nix 
    ./firefox.nix
    ./git.nix
    ./hyprland.nix
    ./waybar.nix
  ];

}
