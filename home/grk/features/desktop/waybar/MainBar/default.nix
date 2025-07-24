{ config, ... }:
{
  imports = [
    ./center-modules
    ./left-modules
    ./right-modules
  ];
  programs.waybar.settings.mainbar = {
    layer = "top";
    position = "top";
    height = config.waybar.barHeight;
    margin = "5 5 0 5";
    spacing = 0;
  };
}