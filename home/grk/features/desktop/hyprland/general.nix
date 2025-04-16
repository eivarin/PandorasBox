{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings.general = {
      border_size = "2";
      gaps_out = "5,10,10,10";
      "col.inactive_border" = "rgba(00000000)";
      "col.active_border" = "rgb(2a9dfb)";
      "col.nogroup_border" = "rgba(00000000)";
      "col.nogroup_border_active" = "rgb(2a9dfb)";
      resize_on_border = true;
    };
  };
}