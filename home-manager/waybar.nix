{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        y = 10;

        modules-left = [ "hyprland/language" "keyboard-state" "custom/diskspace" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "custom/battery" ];

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

        "custom/diskspace" = {
          format = "{}";
          return-type = "text";
          exec = "df -h | grep \"/$\" | awk '{print \"󰒋 \" $5}'";
          interval = 60;
          tooltip = false;
        };

        "clock" = {
          timezone = "Europe/Moscow";
          locale = "ja_JP.utf8";
          format = "{:L%a・%d日%B・%H:%M}";
          tooltip = false;
        };
"custom/battery" = {
          format = "{}";
          return-type = "text";
          exec = "sh /home/yuri/nixos-config/scripts/for_waybar/battery.sh";
          interval = 10;
          tooltip = false;
        };

        "pulseaudio" = {
          format = "󰕾 {volume: >3}% ";
          format-bluetooth = "󰂰 {volume: >3}% ";
          format-muted = "音無し";
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
font-family: CaskaydiaCove;
font-size: 16px;
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
    font-family: Ricty;
    font-size: 18px;
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
    padding-right: 0px;
    padding-left: 0px;
    border-radius: 0px 0px 0px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
}

#custom-diskspace {
    min-width: 40px;
    padding-left: 0px;
    padding-right: 8px;
    border-radius: 0px 8px 8px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
    font-family: Ricty;
    font-size: 18px;
}

#custom-battery {
    min-width: 60px;
    padding-left: 0px;
    padding-right: 0px;
    border-radius: 0px 8px 8px 0px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
    font-family: Ricty;
    font-size: 16px;
}

#pulseaudio {
    min-width: 60px;
    padding-right: 0px;
    padding-left: 8px;
    border-radius: 8px 0px 0px 8px;
    transition: none;
    color: #ffffff;
    background: #1a1623;
    font-family: Ricty;
    font-size: 16px;
}
      '';
  };
}
