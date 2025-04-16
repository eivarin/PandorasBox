{ ... }:
{
  imports = [
    ./hyprland-window.nix
  ];
  config = {
      programs.waybar.settings.mainbar.modules-center = [
        "hyprland/window"
      ];
  };
}