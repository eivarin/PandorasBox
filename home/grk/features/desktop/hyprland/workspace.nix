{ ... }:

{
  wayland.windowManager.hyprland.settings.workspace = [
    "special:MainTerminal, on-created-empty:kitty --session=MainTerminal.session --listen-on unix:/tmp/MainTerminal"
    "special:F1, on-created-empty:zen"
    "special:F11, on-created-empty:spotify"
    "special:F12, on-created-empty:discord"
  ];
}