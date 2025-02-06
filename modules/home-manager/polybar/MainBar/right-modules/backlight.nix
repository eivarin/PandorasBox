{ pkgs, lib, config, ... }:
{
  services.polybar.settings."module/backlight" = {
    type = "internal/backlight";
    enable-scroll = true;
    scroll-interval = 10;
    format = {
      text = "%{T3}<ramp>%{T-}%{O2}:<label>";
      overline = "\${colors.primary-60}";
      padding = 1;
    };
    ramp = {
      text = ["󱩏" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖"];
      foreground = "\${colors.foreground-alt}";
    };
  };
}