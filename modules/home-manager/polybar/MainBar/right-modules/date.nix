{ pkgs, lib, config, ... }:
{
  services.polybar.settings."module/date" = {
    type = "internal/date";
    interval = 5;
    date-alt = " %Y-%m-%d";
    time = "%H:%M";
    time-alt = "%H:%M:%S";
    format = {
      prefix = {
        prefix = "%{T3}%{T-}";
        foreground = "\${colors.foreground-alt}";
      };
      padding = 1;
      overline = "\${colors.primary}";
    };
    label = "%date% %time%";
  };
}