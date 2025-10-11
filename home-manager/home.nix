{ config, pkgs, ...}: 
let 
  dorionOverlay = self: super: {
    dorion = super.callPackage ./custom-packages/dorion.nix { };
  };
in
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ dorionOverlay ];

  imports = [ 
    ./modules/dorion.nix

    ./alacritty.nix
    ./bash.nix 
    ./dorion.nix
    ./firefox.nix
    ./git.nix
    ./hyprland.nix
    ./waybar.nix
  ];
  
  home = {
    username = "yuri";
    homeDirectory = "/home/yuri";
    stateVersion = "25.05";
    packages = with pkgs; [
      telegram-desktop
      litemdview
    ];
  };


}
