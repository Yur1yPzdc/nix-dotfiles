{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    fira-code-symbols
    cascadia-code
    kochi-substitude
  ];

  fonts.fontconfig.ultimate.enable = true;
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ mozc ];

}
