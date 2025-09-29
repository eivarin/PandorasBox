{ ... }:
{
  imports = [
    ./global
    ./features/desktop
    ../../options/desktop
  ];

  wallpaper = ../../wallpapers/grk.png;

  monitors = [
    {
      name = "DP-1";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "0x1080";
      enabled = true;
      workspace = null;
    }
    {
      name = "DP-2";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "1920x1080";
      enabled = true;
      workspace = null;
    }
    {
      name = "DP-3";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "0x0";
      enabled = true;
      workspace = null;
    }
    {
      name = "HDMI-A-3";
      primary = false;
      mode = "highres";
      scale = 1.0;
      position = "1920x0";
      enabled = true;
      workspace = null;
    }
    {
      name = "";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "auto";
      enabled = true;
      workspace = null;
    }
  ];

  waybar = {
    rightModules = [
      "network#eno1"
      # "network#wlp4s0"
      "group/perf"
      "group/pulseaudioGrp"
      # "pulseaudio"
      "group/powermenu"
    ];
    leftModules = [
      "hyprland/language"
      "hyprland/submap"
      # "mpris"
      "tray"
      "idle_inhibitor"
      "hyprland/workspaces"
    ];
    # centerModules = [];
    networkInterfaces = {
      eno1 = "ethernet";
      # wlp12s0 = "wifi";
    };
    # batteryInterfaces = [
    #   "BAT0"
    #   "BAT1"
    # ];
    compactMode = false; # Set to true if you want a more compact Waybar
    barHeight = 26;
  };
}
