{

  imports = [ ./alacritty-tokyo-night.nix ];

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.85;

      font = {
        size = 14.0;
        normal = {
          family = "CaskaydiaCove NF";
          style = "SemiLight";
        };
      };
    };
  };
}
