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
        modules-right = [ "pulseaudio" "custom/battery" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          min-length = 50;
          tooltip = false;
        };

        "hyprland/language" = {
          format-en = "Nya ฅ^•ﻌ•^ฅ ";
          format-ru = "Няя ฅ^•ﻌ•^ฅ ";
          min-length = 12;
          tooltip = false;
        };

        "keyboard-state" = {
          capslock = true;
          numlock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = " ";
          };
          device-path = "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd";
          tooltip = false;
        };

        "clock" = {
          timezone = "Asia/Novosibirsk";
          locale = "ja_JP.utf8";
          format = "{:L%a | %d日 %B | %H:%M }";
          tooltip = false;
        };

        "custom/battery" = {
          format = "{}";
          return-type = "text";
          exec = "../scripts/for_waybar/battery.sh";
          interval = "10";
          tooltip = false;
        };

        # "battery" = {
        #   format = "󰂂 {capacity}% ";
        #   tooltip = false;
        # };

        "pulseaudio" = {
          format= "󰕾 {volume}% ";
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
font-family: IpaexGothic;
font-size: 14px;
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
    font-family: CascadiaCove;
    font-size: 16px;
}

#keyboard-state {
    padding-right: 8px;
    padding-left: 0px;
    border-radius: 0px 8px 8px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
    font-family: CascadiaCove;
    font-size: 16px;
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
