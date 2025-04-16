{ ... }:

{
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "us,pt";
    kb_options = "grp:win_space_toggle";
    touchpad = {
      disable_while_typing = false;
      natural_scroll = true;
      scroll_factor = 0.8;
    };
  };
}