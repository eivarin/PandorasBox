{ ... }:
{
  programs.waybar.settings.mainbar = {
    "backlight" = {
      format = "{icon} {percent}%";
      format-icons = ["󱩏" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖"];
      on-click = "brightnessctl set +5%";
      on-click-right = "brightnessctl set 5%-";
    };
  };
}