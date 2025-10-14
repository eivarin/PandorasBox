{ ... }:

{
  wayland.windowManager.hyprland.settings.workspace = [
    "special:MainTerminal, on-created-empty:rm -rf /tmp/MainTerminal && kitty --session=MainTerminal.session --listen-on unix:/tmp/MainTerminal"
    "special:F1, on-created-empty:zen"
    "special:F9, on-created-empty:firefoxpwa site launch 01K5SX3150TDTD8HQT51DR51MF"
    "special:F10, on-created-empty:firefoxpwa site launch 01K5SX1WZH0PK95RVz4K5X5YSBJ"
    "special:F11, on-created-empty:spotify"
    "special:F12, on-created-empty:discord"
  ];
}