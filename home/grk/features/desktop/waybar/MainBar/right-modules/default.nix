{ config, ... }:
{
  imports = [
    ./perf.nix
    ./battery.nix
    ./network.nix
    ./backlight.nix
    ./pulseaudio.nix
    ./powermenu.nix
  ];
  config = {
    programs.waybar.settings.mainbar.modules-right = config.waybar.rightModules;
  };
}