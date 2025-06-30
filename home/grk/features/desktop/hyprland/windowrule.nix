{ ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    "noshadow, focus:0"
    "workspace special:F11, class:Spotify"
    "workspace special:F12, class:discord"
    "float, class:com.github.hluk.copyq"
  ];
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    "suppressevent maximize, class:^(zen)$"
  ];
}