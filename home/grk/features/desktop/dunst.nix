{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        dmenu = "${pkgs.wofi}/bin/wofi -d ";
        follow = "mouse";
        origin = "bottom-center";
        frame_color = "#8aadf4";
        separator_color = "frame";
        highlight = "#8aadf4";
        width = "(0,1024)";
        progress_bar_max_width = 1024;
        min_icon_size = 129;
        max_icon_size = 128;
      };
      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
      };
      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
      };
      urgency_critical = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_color = "#f5a97f";
      };
    };
  };
}
