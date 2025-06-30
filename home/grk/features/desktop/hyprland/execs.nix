
{
  wayland.windowManager.hyprland.settings = {
    exec = [];
    exec-once = [
      "sleep 1 && waybar"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "bitwarden-resize-script"
    ];
  };
}