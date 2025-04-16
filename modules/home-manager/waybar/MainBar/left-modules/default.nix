{ ... }:
{
  imports = [
    ./hyprland-workspaces.nix
    ./tray.nix
  ];
  config = {
      programs.waybar.settings.mainbar.modules-left = [
        "hyprland/language"
        "tray"
        "hyprland/workspaces"
      ];
  };
}