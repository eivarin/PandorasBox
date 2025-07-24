{ config, ... }:
{
  programs.waybar.settings.mainbar."tray" = {
    icon-size = config.waybar.barHeight - 12;
    show-passive-items = true;
    spacing = 2;
    # reverse-direction = true;
    # smooth-scrolling-threshold = 5;
  };
}