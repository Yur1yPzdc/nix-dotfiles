{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
      hmswitch = "home-manager switch --flake ~/nixos-config";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      wifi = "sh ~/.wifi/wifi.sh";
      ds-proxy = "nohup discord --proxy-server=socks5://127.0.0.1:1080 &";
    };
  };
}
