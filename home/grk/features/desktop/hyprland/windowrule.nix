{ ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    "noshadow, focus:0"
    "workspace special:F11, class:Spotify"
    "workspace special:F12, class:discord"
    "pin, class:MainPicker"
    "float, class:qalculate-gtk"
    "persistentsize, class:qalculate-gtk"
    "pin, class:qalculate-gtk"
    # "center, floating:1"
    "float, class:Emulator"
    "pseudo, class:Emulator"
    "suppressevent maximize, class:^(zen)$"
  ];
}