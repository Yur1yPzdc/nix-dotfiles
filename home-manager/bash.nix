{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "doas nixos-rebuild switch --flake ~/nixos-config";
      hmswitch = "home-manager switch --flake ~/nixos-config";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      wifi = "sh ~/nixos-config/scripts/wifi/wifi.sh";
    };
  };
}
