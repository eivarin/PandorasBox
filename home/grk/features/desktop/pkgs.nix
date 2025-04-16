{ pkgs, inputs, config, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    discord
    spotify
    obsidian
    inputs.zen-browser.packages."${config.systemArch}".default
    font-awesome
    tldr
    google-chrome
    chromium
    multiviewer-for-f1
    kitty
  ];
}
