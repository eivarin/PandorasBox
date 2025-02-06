{ pkgs, lib, config, ... }:
{
  services.polybar.config = {
    "module/tray" = {
      type = "internal/tray";
      tray-padding = 2;
    };
    "module/bspwm" = {
      type = "internal/bspwm";
      fuzzy-match = true;

      format-font = 7;

      label-focused = "%name%";
      label-focused-background = "\${colors.background-alt}";
      label-focused-overline = "\${colors.primary}";
      label-focused-padding = "6pt";

      label-occupied = "%name%";
      label-occupied-padding = "6pt";

      label-urgent = "%name%";
      label-urgent-background = "\${colors.alert}";
      label-urgent-padding = "6pt";

      label-empty = "%name%";
      label-empty-foreground = "\${colors.foreground-alt}";
      label-empty-padding = "6pt";
    };
  };
}