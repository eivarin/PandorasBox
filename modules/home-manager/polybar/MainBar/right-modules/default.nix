{ pkgs, lib, config, ... }:
{
  imports = [
    ./backlight.nix
    ./powermenu.nix
    ./pulseaudio.nix
    ./date.nix
    ./battery.nix
    # ./arrow.nix
  ];
}