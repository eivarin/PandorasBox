{ lib, config, ... }:
let
  batteryConf = {
    format = "{icon}{capacity}%";
    interval = 30;
    states = {
      full = 100;
      good = 80;
      medium = 50;
      warning = 30;
      critical = 10;
    };
    format-icons = {
      default = [
        "󰂎 "
        "󰁺 "
        "󰁻 "
        "󰁼 "
        "󰁽 "
        "󰁾 "
        "󰁿 "
        "󰂀 "
        "󰂁 "
        "󰂁 "
        "󰁹 "
      ];
      charging = [
        "󰂆"
        "󰂇"
        "󰂈"
        "󰂉"
        "󰂊"
        "󰂋"
        "󰂅"
      ];
    };
  };
in
{
  programs.waybar.settings.mainbar = builtins.listToAttrs (
    map (iface: {
      name = "battery#${iface}";
      value = lib.mkMerge [
        batteryConf
        { bat = iface; }
      ];
    }) config.waybar.batteryInterfaces
  );
}
