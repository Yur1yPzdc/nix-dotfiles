{ config, pkgs, ... }:

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
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org"; # Dark theme
          "extensions.install_origins.enabled" = false; 
          "extensions.autoDisableScopes" = 0; # These 2 are for automatic enabling of extensions
          "services.sync.prefs.sync.extensions.activeThemeID" = false; # Dont change theme on other devices
          "browser.migrate.chrome.extensions.enabled" = false; # Remove startup popup  
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
              icon = "https://upload.wikimedia.org/wikipedia/commons/2/28/Nix_snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tabliss
          auto-tab-discard
          betterttv
          seventv
          copy-n-paste
        ];
      };
    };
  };
}
