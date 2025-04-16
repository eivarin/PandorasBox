{ config, ... }:

{
  wayland.windowManager.hyprland.settings.monitor = map (m: 
    "${m.name},${
      if m.enabled
      then "${toString m.mode},${toString m.position},${toString m.scale}"
      else "disabled"
    }"
  ) (config.monitors);
}