{ pkgs, lib, config, ... }:
{
  services.polybar.settings = {
    "template/battery" = {
      type = "internal/battery";
      adapter = "ADP1";
      full-at = 98;
      format = {
        charging = {
          text = "%{T3}<animation-charging>%{T-} <label-charging>";
          overline = "\${colors.primary-20}";
          padding = 1;
        };
        discharging = {
          text = "%{T3}<ramp-capacity>%{T-} <label-discharging>️";
          overline = "\${colors.primary-20}";
          padding = 1;
        };
        full.prefix = {
          text = "%{T3}󰁹%{T-} ";
          foreground = "\${colors.foreground-alt}";
        };
      };
      ramp-capacity = {
        foreground = "\${colors.foreground-alt}";
        text = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂁"];
      };
      animation-charging = {
        foreground = "\${colors.foreground-alt}";
        framerate = 750;
        text = ["󰂆" "󰂇" "󰂈" "󰂉" "󰂊" "󰂋"];
      };
    };
    "module/battery" = {
      "inherit" = "template/battery";
      battery = "BAT0";
    };
    "module/battery1" = {
      "inherit" = "template/battery";
      battery = "BAT1";
    };
  };
}