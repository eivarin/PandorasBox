{ hostOptions, ... }:

{
  imports = [
    ./hyprland
    ./copyq
    ./hypridle
    ./waybar
    ./hyprpaper
    ./hyprlock
    ./wofi
  ];
  config = {
    modules = {
      waybar.enable = hostOptions.EnableGUI;
      copyq.enable = hostOptions.EnableGUI;
      wofi.enable = hostOptions.EnableGUI;
    };
  };
}