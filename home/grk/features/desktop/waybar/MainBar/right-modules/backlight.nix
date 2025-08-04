{ config, ... }:
{
  programs.waybar.settings.mainbar = {
    "group/backlightGrp" = {
      orientation = "inherit";
      modules = [
        "backlight"
        (if config.waybar.compactMode then "" else "backlight/slider")
      ];
    };
    "backlight" = {
      format = if config.waybar.compactMode then "{icon} {percent}%" else "{icon}";
      format-icons = ["󱩏" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖"];
      on-click = "brightnessctl set +5%";
      on-click-right = "brightnessctl set 5%-";
    };
  };
}