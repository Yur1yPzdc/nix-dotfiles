{ config, lib, pkgs, ... } :

let
  cfg = config.programs.dorion;

  prepareSettings = settings: 
    let 
      base = {
        zoom = toString settings.zoom;
        client_mods = if settings.client_mods != null then settings.client_mods else [ "Shelter" ]; 
        push_to_talk_keys = if settings.push_to_talk_keys != null then settings.push_to_talk_keys else [ "RControl" ];
        themes = if settings.themes != null then settings.themes else [ "none" ];
        keybinds = if settings.keybinds != null then settings.keybinds else {};
      };
    in base // lib.attrsets.removeAttrs settings [ "zoom" "themes" "push_to_talk_keys" "client_mods" "keybinds" ];

  hmConfigFile = pkgs.writeText "config.json" (builtins.toJSON (prepareSettings cfg.settings));
in
{
  options.programs.dorion = {
    enable = lib.mkEnableOption "Enable Dorion - tiny client for Discord";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.dorion;
      description = "Dorion package to use";
    };
    
    settings = lib.mkOption {
      type = lib.types.submodule {
        options = {
          autoupdate = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          auto_clear_cache = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          blur = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
          blur_css = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          cache_css = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          client_mods = lib.mkOption {
            type = with lib.types; nullOr (listOf str);
            default = null;
          };
          client_plugins = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          client_type = lib.mkOption {
            type = lib.types.str;
            default = "default";
          };
          desktop_notifications = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          disable_hardware_accel = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          keybinds = lib.mkOption {
            type = with lib.types; nullOr (attrsOf str);
            default = null;
          };
          keybinds_enabled = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          multi_instance = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          open_on_startup = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          profile = lib.mkOption {
            type = lib.types.str;
            default = "default";
          };
          proxy_uri = lib.mkOption {
            type = lib.types.str;
            default = "";
          };
          push_to_talk = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          push_to_talk_keys = lib.mkOption {
            type = with lib.types; nullOr (listOf str);
            default = null;
          };
          rpc_server = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          rpc_ipc_connector = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          rpc_process_scanner = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          rpc_secondary_events = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          rpc_websocket_connector = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          start_maximized = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          startup_minimized = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          streamer_mode_detection = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          sys_tray = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          theme = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
          themes = lib.mkOption {
            type = with lib.types; nullOr (listOf str);
            default = null;
          };

          tray_icon_enabled = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };

          unread_badge = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };

          update_notify = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          use_native_titlebar = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          win7_style_notifications = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          zoom = lib.mkOption {
            type = lib.types.float;
            default = 1.0;
          };
        };
      };
      default = {};
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ 
      # cfg.package
      (pkgs.writeShellScriptBin "Dorion" 
      ''
        # Paths
        CONFIG_DIR="$HOME/.config/dorion"
        RUNTIME_CFG="$CONFIG_DIR/config.json"  # What Dorion expects
        HM_CFG="$CONFIG_DIR/hm-config.json"    # Home Manager's config

        # Ensure directory exists
        mkdir -p "$CONFIG_DIR"

        # Replace runtime config with home-manager config
        rm -f "$RUNTIME_CFG"
        cp "$HM_CFG" "$RUNTIME_CFG"
        chmod +w "$RUNTIME_CFG" 2>/dev/null || true

        # Run Dorion with enabled manual per-session changes
        exec ${cfg.package}/bin/Dorion
      ''
      )
    ];

    xdg.configFile."dorion/hm-config.json".source = hmConfigFile;
    };
  }
