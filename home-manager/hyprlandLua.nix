{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua"; # Migrated to lua

    xwayland = {
      enable = true;
      # force_zero_scaling = true;
    };

    # Settings are converted to Lua tables automatically
    settings = {
      monitor = ",preferred,auto,1";

      env = [
        "AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      ecosystem = {
        no_update_news = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad = {
          scroll_factor = 0.60;
          natural_scroll = true;
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 3;
        "col.active_border" = "rgba(7a4ff4ee) rgba(e681caee) -60deg";
        "col.inactive_border" = "rgba(a257fbaa)";
        layout = "master";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };
        active_opacity = 1.0;
        inactive_opacity = 0.8;
      };

      animations = {
        enabled = true;
        animation = [
          "windows,     1, 7,  default"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      master = {
        mfact = 0.60;
        new_status = "slave";
      };

      gestures = {
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };
    };

    # Function calls (binds, exec-once) must be written as raw Lua
    extraConfig = ''
      local mainMod = "SUPER"
      local secMod = "ALT"

      -- Startup commands
      exec_once("awww-daemon --no_cache")
      exec_once("sh /home/yuri/nixos-config/bg/bg.sh")
      exec_once("waybar")

      -- Exiting Hyprland
      bind(mainMod .. " " .. secMod, "M", "exit")

      -- Opening apps
      bind(secMod, "T", "exec", "alacritty")
      bind(secMod, "Q", "killactive")
      bind(secMod, "F", "exec", "firefox")
      bind(secMod, "B", "exec", "sh $HOME/nixos-config/bg/bg.sh")
      bind(mainMod, "E", "exec", "thunar")
      bind(mainMod, "F", "togglefloating")
      bind(mainMod, "P", "exec", "hyprpicker")
      bind(mainMod, "T", "exec", "Telegram")
      bind(mainMod, "S", "exec", "hyprshot -s -m output DP-1")

      -- Move focus with secMod + arrow keys (hjkl)
      bind(secMod, "H", "movefocus", "l")
      bind(secMod, "L", "movefocus", "r")
      bind(secMod, "K", "movefocus", "u")
      bind(secMod, "J", "movefocus", "d")

      -- Moving windows
      bind(secMod .. " CTRL", "H", "swapwindow", "l")
      bind(secMod .. " CTRL", "L", "swapwindow", "r")
      bind(secMod .. " CTRL", "K", "swapwindow", "u")
      bind(secMod .. " CTRL", "J", "swapwindow", "d")

      -- Window resizing
      bind(mainMod .. " CTRL", "comma", "resizeactive", "-60", "0")
      bind(mainMod .. " CTRL", "period", "resizeactive", "60", "0")
      bind(mainMod .. " SHIFT CTRL", "comma", "resizeactive", "0", "-60")
      bind(mainMod .. " SHIFT CTRL", "period", "resizeactive", "0", "60")

      -- Switch workspaces with mainMod + [0-9]
      bind(mainMod, "1", "workspace", "1")
      bind(mainMod, "2", "workspace", "2")
      bind(mainMod, "3", "workspace", "3")
      bind(mainMod, "4", "workspace", "4")
      bind(mainMod, "5", "workspace", "5")
      bind(mainMod, "6", "workspace", "6")
      bind(mainMod, "7", "workspace", "7")
      bind(mainMod, "8", "workspace", "8")
      bind(mainMod, "9", "workspace", "9")
      bind(mainMod, "0", "workspace", "10")

      -- Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind(mainMod .. " SHIFT", "1", "movetoworkspacesilent", "1")
      bind(mainMod .. " SHIFT", "2", "movetoworkspacesilent", "2")
      bind(mainMod .. " SHIFT", "3", "movetoworkspacesilent", "3")
      bind(mainMod .. " SHIFT", "4", "movetoworkspacesilent", "4")
      bind(mainMod .. " SHIFT", "5", "movetoworkspacesilent", "5")
      bind(mainMod .. " SHIFT", "6", "movetoworkspacesilent", "6")
      bind(mainMod .. " SHIFT", "7", "movetoworkspacesilent", "7")
      bind(mainMod .. " SHIFT", "8", "movetoworkspacesilent", "8")
      bind(mainMod .. " SHIFT", "9", "movetoworkspacesilent", "9")
      bind(mainMod .. " SHIFT", "0", "movetoworkspacesilent", "10")

      -- Volume and Media Control
      bind("", "XF86AudioRaiseVolume", "exec", "pamixer -i 5")
      bind("", "XF86AudioLowerVolume", "exec", "pamixer -d 5")
      bind("", "XF86AudioMute", "exec", "pamixer -t")
      bind("", "XF86AudioMicMute", "exec", "pamixer --default-source -m")
      
      -- Brightness control
      bind("", "XF86MonBrightnessDown", "exec", "brightnessctl set 5%-")
      bind("", "XF86MonBrightnessUp", "exec", "brightnessctl set +5%")

      -- Move/resize windows with mainMod + LMB/RMB and dragging
      bindm(mainMod, "mouse:272", "movewindow")
      bindm(mainMod, "mouse:273", "resizewindow")
    '';
  };
}
