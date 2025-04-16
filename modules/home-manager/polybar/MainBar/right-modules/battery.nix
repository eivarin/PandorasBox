{ ... }:
{
  services.polybar.settings = {
    "template/battery" = {
      type = "internal/battery";
      adapter = "ADP1";
      full-at = 98;
      format = {
        charging = {
          text = "%{T3} <animation-charging>%{T-}<label-charging>";
          overline = "\${colors.primary-20}";
        };
        discharging = {
          text = "%{T3} <ramp-capacity>%{T-}<label-discharging>️";
          overline = "\${colors.primary-20}";
        };
        full = {
          text = "%{T3} 󰁹%{T-}<label-full>️";
          overline = "\${colors.primary-20}";
        };
      };
      label = {
        charging = {
          padding = 1;
        };
        discharging = {
          padding = 1;
        };
        full = {
          padding = 1;
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