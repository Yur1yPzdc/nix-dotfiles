{ config, pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "Yuri";
        isDefault = true;
        settings = {
          "browser.search.defaultenginename" = "Google";
          "extensions.autoDisableScopes" = 0;
        };
        search = {
          force = true;
          default = "Google";
        };
        extensions = with pkgs.nur.repos; [
          crazazy.firefox-addons.ublock-origin
          crazazy.firefox-addons.youtube_downloader_webx
          crazazy.firefox-addons.tabliss
          rycee.firefox-addons.proton-vpn
        ];
      };
    };
  };
}
