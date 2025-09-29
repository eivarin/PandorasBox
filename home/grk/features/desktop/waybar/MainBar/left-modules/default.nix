{ config, ... }:
{
  imports = [
    ./hyprland-workspaces.nix
    ./idle_inhibitor.nix
    ./tray.nix
    ./mpris.nix
  ];
  config = {
      programs.waybar.settings.mainbar.modules-left = config.waybar.leftModules;
  };
}