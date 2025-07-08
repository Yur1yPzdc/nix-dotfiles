{ options, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      "DisableTelemetry" = true;
      "DisableFirefoxStudies" = true;
      "EnableTrackingProtection" = {
        "Value" = true;
        "Locked" = true;
        "Cryptomining" = true;
        "Fingerprinting" = true;
      };
      "DisablePocket" = true;
      "DisableFirefoxAccounts" = false;
      "DisableAccounts" = false;
      "DisableFirefoxScreenshots" = true;
      "OverrideFirstRunPage" = "";
      "OverridePostUpdatePage" = "";
      "DontCheckDefaultBrowser" = true;
      "DisplayBookmarksToolbar" = "always"; # alternatives: "always" or "newtab"
      "DisplayMenuBar" = "default-off"; # alternatives: "always", "never" or "default-on"
      "SearchBar" = "unified"; # alternative: "separate"
      "Proxy" = {
        "Mode" = "manual";
        "SOCKSVersion" = 5;
        "SOCKSProxy" = "127.0.0.1:1080";
      };
      "SkipTermsOfUse" = true;
      "InstallAddonsPermission"."Default" = true;
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.search.defaultenginename" = "google";
          "browser.search.order.1" = "google";
        };
        search = {
          force = true;
          default = "google";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              #icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              icon = "https://upload.wikimedia.org/wikipedia/commons/2/28/Nix_snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tabliss
          tranquility-1
          auto-tab-discard
          betterttv
          seventv
        ];
      };
    };
  };
}
