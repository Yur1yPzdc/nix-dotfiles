{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        y = 10;

        modules-left = [ "hyprland/language" "keyboard-state" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "battery" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          min-length = 50;
          tooltip = false;
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ru = "RU";
          min-length = 5;
          tooltip = false;
        };

        "keyboard-state" = {
          capslock = true;
          numlock = true;
          format = "{icon} ";
          format-icons = {
             locked = " ";
            unlocked = "";
          };
          tooltip = false;
        };

        "clock" = {
          timezone = "Asia/Novosibirsk";
          locale = "ja_JP.utf8";
          format = "{:L%a | %d %B | %H:%M }";
          tooltip = false;
        };

        "battery" = {
          format = "󰂂{capacity}% ";
          tooltip = false;
        };

        "pulseaudio" = {
          format= "󰕾{volume}% ";
          tooltip = false;
        };

      };
    };

    style = 
      ''
*
{
border: none;
border-radius: 0;
font-family: JetBrains Mono;
font-weight: bold; 
min-height: 20px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 1.0;
}

#clock {
    padding-left: 8px;
    padding-right: 8px;
    border-radius: 8px 8px 8px 8px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
}

#language {
    padding-left: 8px;
    padding-right: 0px;
    border-radius: 8px 0px 0px 8px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
}

#keyboard-state {
    padding-right: 8px;
    padding-left: 0px;
    border-radius: 0px 8px 8px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
}

#battery {
    padding-left: 8px;
    padding-right: 0px;
    border-radius: 0px 8px 8px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
}

#pulseaudio {
    min-width: 50px;
    padding-right: 0px;
    padding-left: 8px;
    border-radius: 0px 0px 0px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
}
      '';
  };
}
