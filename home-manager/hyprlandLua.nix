{
<<<<<<< HEAD
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
=======
  # Home Manager module: replace the old Hyprland module import with this one.
  # Requires a Home Manager revision with configType = "lua" support.
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;

>>>>>>> update
    extraConfig = ''
      local mainMod = "SUPER"
      local secMod = "ALT"

<<<<<<< HEAD
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
=======
      hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1,
      })

      -- Preserve the GPU order from the original config; verify on this PC.
      hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
      hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
      hl.env("XDG_SESSION_TYPE", "wayland")
      hl.env("XCURSOR_SIZE", "24")
      hl.env("QT_QPA_PLATFORM", "wayland")
      hl.env("XDG_SCREENSHOTS_DIR", os.getenv("HOME") .. "/screens")
      hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
      -- hl.env("HYPRCURSOR_THEME", "Vivian_umbrella")
      -- hl.env("HYPRCURSOR_SIZE", 48)

      hl.config({
        debug = {
          disable_logs = false,
          enable_stdout_logs = true,
        },
        ecosystem = {
          no_update_news = true,
        },
        input = {
          kb_layout = "us,ru",
          kb_options = "grp:alt_shift_toggle",
          follow_mouse = 1,
          sensitivity = 0,
          touchpad = {
            scroll_factor = 0.60,
            natural_scroll = true,
          },
        },
        general = {
          gaps_in = 4,
          gaps_out = 8,
          border_size = 3,
          col = {
            active_border = {
              colors = { "rgba(7a4ff4ee)", "rgba(e681caee)" },
              angle = 300, -- Equivalent to the original -60 degrees.
            },
            inactive_border = "rgba(a257fbaa)",
          },
          layout = "master",
        },
        decoration = {
          rounding = 10,
          active_opacity = 1.0,
          inactive_opacity = 0.8,
          blur = {
            enabled = true,
            size = 16,
            passes = 2,
            new_optimizations = true,
          },
        },
        animations = {
          enabled = true,
        },
        dwindle = {
          preserve_split = true,
        },
        master = {
          mfact = 0.60,
          new_status = "slave",
        },
        gestures = {
          workspace_swipe_invert = false,
          workspace_swipe_distance = 200,
          workspace_swipe_forever = true,
        },
        misc = {
          animate_manual_resizes = true,
          animate_mouse_windowdragging = true,
          enable_swallow = true,
          force_default_wallpaper = 1,
          disable_hyprland_logo = true,
        },
      })

      hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "default" })
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
      hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
      hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
      hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

      -- Swiping was commented out in the original config. To enable it:
      -- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

      -- The startup event replaces exec-once; reloads do not relaunch these apps.
      hl.on("hyprland.start", function()
        hl.exec_cmd("awww-daemon")
        hl.exec_cmd("sh /home/yuri/nixos-config/bg/bg.sh")
        hl.exec_cmd("waybar")
      end)

      -- Exit, launch apps, close and float windows.
      hl.bind(mainMod .. " + " .. secMod .. " + M", hl.dsp.exit())
      hl.bind(secMod .. " + T", hl.dsp.exec_cmd("alacritty"))
      hl.bind(secMod .. " + Q", hl.dsp.window.close())
      hl.bind(secMod .. " + F", hl.dsp.exec_cmd("firefox"))
      -- hl.bind(secMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
      hl.bind(secMod .. " + B", hl.dsp.exec_cmd('sh "$HOME/nixos-config/bg/bg.sh"'))
      hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
      hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker"))
      -- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- Dwindle only.
      hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
      hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -s -m output DP-1"))

      -- Focus and swap windows with the original Vim-style directions.
      local directions = { H = "left", L = "right", K = "up", J = "down" }
      for key, direction in pairs(directions) do
        hl.bind(secMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
        hl.bind(secMod .. " + CTRL + " .. key, hl.dsp.window.swap({ direction = direction }))
      end

      -- Relative resize: preserve the original 60-pixel steps.
      hl.bind(mainMod .. " + CTRL + comma", hl.dsp.window.resize({ x = -60, y = 0, relative = true }))
      hl.bind(mainMod .. " + CTRL + period", hl.dsp.window.resize({ x = 60, y = 0, relative = true }))
      hl.bind(mainMod .. " + SHIFT + CTRL + comma", hl.dsp.window.resize({ x = 0, y = -60, relative = true }))
      hl.bind(mainMod .. " + SHIFT + CTRL + period", hl.dsp.window.resize({ x = 0, y = 60, relative = true }))

      -- Workspaces 1-10; key 0 selects workspace 10.
      for workspace = 1, 10 do
        local key = tostring(workspace % 10)
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({
          workspace = workspace,
          follow = false, -- Original movetoworkspacesilent behavior.
        }))
      end

      -- Preserve the original audio and brightness commands and bind behavior.
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))
      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
      hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -m"))
      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))

      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
>>>>>>> update
    '';
  };
}
