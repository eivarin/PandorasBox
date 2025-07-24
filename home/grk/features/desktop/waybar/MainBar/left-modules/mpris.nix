{ config, ... }:
{
  programs.waybar.settings.mainbar.mpris = {
    format = "{player_icon}{artist} - {title}";
    player-icons = {
      default = "";
      spotify = "";
    };
  };
}