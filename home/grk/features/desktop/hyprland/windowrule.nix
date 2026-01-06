{ ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    "match:focus yes, no_shadow on"
    "match:class Spotify, workspace special:F11"
    "match:class discord, workspace special:F12"
    "match:class MainPicker, pin on"
    "match:class qalculate-gtk, persistent_size on"
    "match:class qalculate-gtk, pin on"
    "match:class qalculate-gtk, float on"
    "match:class Emulator, float on"
    "match:class Emulator, pseudo on"
    "match:class ^(zen)$, suppress_event maximize"
  ];
}