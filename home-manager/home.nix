{ pkgs, ...}: 

{
  nixpkgs.config.allowUnfree = true;
  imports = [ 
    ./alacritty.nix
    ./bash.nix 
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
      # telegram-desktop
    ];
  };
}
