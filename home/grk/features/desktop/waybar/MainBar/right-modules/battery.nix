{ lib, ... }:
let 
  batteryIconConf = {
    format = "{icon}";
    interval = 30;
    states = {
      full = 100;
      good = 80;
      medium = 50;
      warning = 30;
      critical = 10;
    };
    format-icons = {
      default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂁" "󰁹"];
      charging = ["󰂆" "󰂇" "󰂈" "󰂉" "󰂊" "󰂋" "󰂅"];
    };
  };
  batteryLabelConf = {
    format = "{capacity}%";
    interval = 30;
    states = {
      full = 100;
      good = 80;
      medium = 50;
      warning = 30;
      critical = 10;
    };
  };
in
{
  programs.waybar.settings.mainbar = {
    "battery#bat0icon" = lib.mkMerge [ batteryIconConf { bat = "BAT0"; } ];
    "battery#bat0label" = lib.mkMerge [ batteryLabelConf { bat = "BAT0"; } ];
    "battery#bat1icon" = lib.mkMerge [ batteryIconConf { bat = "BAT1"; } ];
    "battery#bat1label" = lib.mkMerge [ batteryLabelConf { bat = "BAT1"; } ];
    "group/bat0" = {
      orientation = "inherit";
      modules = [
        "battery#bat0icon"
        "battery#bat0label"
      ];
    };
    "group/bat1" = {
      orientation = "inherit";
      modules = [
        "battery#bat1icon"
        "battery#bat1label"
      ];
    };
  };
  # services.polybar.settings = {
  #   "template/battery" = {
  #     type = "internal/battery";
  #     adapter = "ADP1";
  #     full-at = 98;
  #     format = {
  #       charging = {
  #         text = "%{T3} <animation-charging>%{T-}<label-charging>";
  #         overline = "\${colors.primary-20}";
  #       };
  #       discharging = {
  #         text = "%{T3} <ramp-capacity>%{T-}<label-discharging>️";
  #         overline = "\${colors.primary-20}";
  #       };
  #       full = {
  #         text = "%{T3} 󰁹%{T-}<label-full>️";
  #         overline = "\${colors.primary-20}";
  #       };
  #     };
  #     label = {
  #       charging = {
  #         padding = 1;
  #       };
  #       discharging = {
  #         padding = 1;
  #       };
  #       full = {
  #         padding = 1;
  #       };
  #     };
  #     ramp-capacity = {
  #       foreground = "\${colors.foreground-alt}";
  #       text = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂁"];
  #     };
  #     animation-charging = {
  #       foreground = "\${colors.foreground-alt}";
  #       framerate = 750;
  #       text = ["󰂆" "󰂇" "󰂈" "󰂉" "󰂊" "󰂋"];
  #     };
  #   };
  #   "module/battery" = {
  #     "inherit" = "template/battery";
  #     battery = "BAT0";
  #   };
  #   "module/battery1" = {
  #     "inherit" = "template/battery";
  #     battery = "BAT1";
  #   };
  # };
}