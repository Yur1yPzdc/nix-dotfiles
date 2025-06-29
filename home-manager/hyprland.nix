{
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
      # force_zero_scaling = true;
    };

    settings = {
      "$mainMod" = "SUPER";
      "$secMod"  =   "ALT";

      monitor = ",1920x1080@60,auto,1";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,20"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_variant = "lang";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          scroll_factor = 0.60;
          natural_scroll = true;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(7a4ff4ee) rgba(e681caee) -60deg";
        "col.inactive_border" = "rgba(a257fbaa)";

        layout = "master";

        # no_cursor_warps = false;
      };

      decoration = {
        rounding = 10;

        blur = {
         enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        #drop_shadow = false;
        #shadow_range = 4;
        #shadow_render_power = 3;
        #"col.shadow" = "rgba(1a1a1aee)";

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
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        mfact = 0.60;
        new_status = "slave";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        # force_default_wallpaper = -1;
        # disable_hyprland_logo = false;
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"
        # "opacity 1.0 0.75"
      ];

      exec-once = [
        "swww-daemon"
        "sh $HOME/.bg/bg.sh"
        "waybar"
        "sh $HOME/.wifi/run.sh"
        #"eww daemon"
        "eww open wifi_box"
      ];

      bind = [
        # Exiting Hyprland
        "$mainMod $secMod, M, exit,"

        # Opening apps
        "$secMod,  T, exec, alacritty"
        "$secMod,  Q, killactive,"
        "$secMod,  F, exec, firefox"
        "$secMod,  D, exec, rofi -show drun"
        "$secMod,  B, exec, sh /home/yuri/.bg/bg.sh"
        "$mainMod, E, exec, thunar"
        "$mainMod, F, togglefloating,"
        "$mainMod, P, exec, gpick"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, T, exec, telegram-desktop"

        # Move focus with mainMod + arrow keys
        "$secMod, H, movefocus, l"
        "$secMod, L, movefocus, r"
        "$secMod, K, movefocus, u"
        "$secMod, J, movefocus, d"

        # Moving windows
        "$secMod CTRL, H, swapwindow, l"
        "$secMod CTRL, L, swapwindow, r"
        "$secMod CTRL, K, swapwindow, u"
        "$secMod CTRL, J, swapwindow, d"

        # Window resizing                            X   Y
        "$mainMod       CTRL, comma,  resizeactive, -60   0"
        "$mainMod       CTRL, period, resizeactive,  60   0"
        "$mainMod SHIFT CTRL, comma,  resizeactive,   0 -60"
        "$mainMod SHIFT CTRL, period, resizeactive,   0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + scroll
        # "$mainMod, mouse_down, workspace, e+1"
        # "$mainMod, mouse_up, workspace, e-1"

        # Keyboard backlight
        # "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        # "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        
        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Configuration files
        # ''$mainMod SHIFT, N, exec, alacritty -e sh -c "rb"''
        # ''$mainMod SHIFT, C, exec, alacritty -e sh -c "conf"''
        # ''$mainMod SHIFT, H, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
        # ''$mainMod SHIFT, W, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''
        # '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Waybar
        # "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        # "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Disable all effects
        # "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
