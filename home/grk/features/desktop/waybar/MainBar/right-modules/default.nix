{ ... }:
{
  imports = [
    ./perf.nix
    ./battery.nix
    ./clock.nix
    ./network.nix
    ./backlight.nix
    ./pulseaudio.nix
    ./powermenu.nix
  ];
  config = {
      programs.waybar.settings.mainbar.modules-right = [
        "group/ethernet"
        "group/wifi"
        "group/perf"
        "group/backlight"
        "group/pulseaudio"
        "group/bat0"
        "group/bat1"
        "group/clock"
        "group/powermenu"
      ];
  };
}