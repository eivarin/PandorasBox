
{
  wayland.windowManager.hyprland.settings = {
    exec = [];
    exec-once = [
      "sleep 1 && waybar"
      "copyq --start-server" 
    ];
  };
}