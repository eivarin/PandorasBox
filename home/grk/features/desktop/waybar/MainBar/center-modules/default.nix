{ config, ... }:
{
  imports = [
    ./hyprland-window.nix
    ./clock.nix
  ];
  config = {
      programs.waybar.settings.mainbar.modules-center = config.waybar.centerModules;
  };
}