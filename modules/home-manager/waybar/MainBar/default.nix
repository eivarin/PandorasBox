{ ... }:
{
  imports = [
    ./center-modules
    ./left-modules
    ./right-modules
  ];
  programs.waybar.settings.mainbar = {
    layer = "top";
    position = "top";
    height = 26;
    margin = "5 5 0 5";
    spacing = 5;
    # output = [
    #   "eDP-1"
    #   "HDMI-A-2"
    # ];
  };
}

# services.polybar.config."bar/Main" = {
#   "inherit" = "fonts";
#   monitor = "\${env:MONITOR:}";
#   width = "100%:-10";
#   height = 26;
#   offset-x = "5px";
#   offset-y = 5;
#   radius = 8;
#   fixed-center = true;
#   enable-ipc = true;

#   background = "\${colors.background}";
#   foreground = "\${colors.foreground}";

#   padding = 1;
#   module-margin = "2px";

#   modules-left = "tray bspwm";
#   modules-center = "xwindow";
#   modules-right = "arrow backlight pulseaudio battery1 battery date powermenu";

#   wm-restack = "bspwm";
#   line-size = 1;

#   override-redirect = "true";

#   cursor-click = "pointer";
#   cursor-scroll = "ns-resize";
# };