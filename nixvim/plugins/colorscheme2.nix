{
  programs.nixvim.colorschemes = {
    kanagawa = {
      settings.theme = "dragon";
      settings.background.dark = "dragon";
      enable = true;
    };

    tokyonight = {
      enable = false;
      settings.style = "night";
    };
  };
}

