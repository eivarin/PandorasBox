{ pkgs, inputs, hostOptions, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    discord
    spotify
    obsidian
    inputs.zen-browser.packages."${hostOptions.system}".default
    font-awesome
    tldr
    google-chrome
    chromium
    multiviewer-for-f1
  ];
}