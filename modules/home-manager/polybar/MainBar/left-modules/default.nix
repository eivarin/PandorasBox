{ pkgs, lib, config, ... }:
{
  imports = [
    ./tray.nix
    ./bspwm.nix
  ];
}