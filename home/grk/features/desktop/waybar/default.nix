{ config, inputs, pkgs, ... }:

{
  imports = [
    ./style.nix
    ./MainBar
  ];
  programs.waybar = {
    enable = true;
    # package = inputs.waybar-untested.packages."${config.systemArch}".waybar;
    package = pkgs.waybar;
  };
}