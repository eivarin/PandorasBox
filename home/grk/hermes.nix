{ ... }:
{
  imports = [
    ./global
    ./features/desktop
    ../../options/desktop
  ];

  wallpaper = ../../wallpapers/grk.png;

  waybar = {
    rightModules = [
      "network#enp0s31f6"
      "network#wlp4s0"
      "group/perf"
      "group/backlightGrp"
      "group/pulseaudioGrp"
      "battery#BAT0"
      "battery#BAT1"
      "group/powermenu"
    ];
    # leftModules = [];
    # centerModules = [];
    networkInterfaces = {
      enp0s31f6 = "ethernet";
      wlp4s0 = "wifi";
    };
    batteryInterfaces = [
      "BAT0"
      "BAT1"
    ];
    compactMode = true; # Set to true if you want a more compact Waybar
    barHeight = 26; # Default icon size for the tray module
  };

  monitors = [
    {
      name = "eDP-1";
      primary = true;
      mode = "preferred";
      position = "auto";
      scale = 1.0;
      enabled = true;
      workspace = null;
    }
    {
      name = "";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "auto-up";
      enabled = true;
      workspace = null;
    }
  ];
}
