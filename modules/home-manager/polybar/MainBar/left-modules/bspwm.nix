{ pkgs, lib, config, ... }:
{
  services.polybar.settings."module/bspwm" = {
    type = "internal/bspwm";
    fuzzy-match = true;

    format-font = 7;

    label = {
      focused = {
        text = "%name%";
        background = "\${colors.background-alt}";
        overline = "\${colors.primary}";
        padding = "6pt";
      };
      occupied = {
        text = "%name%";
        padding = "6pt";
      };
      urgent = {
        text = "%name%";
        background = "\${colors.alert}";
        padding = "6pt";
      };
      empty = {
        text = "%name%";
        foreground = "\${colors.foreground-alt}";
        padding = "6pt";
      };
    };
  };
}