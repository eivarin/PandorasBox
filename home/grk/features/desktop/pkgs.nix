{
  pkgs,
  inputs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    pavucontrol
    discord
    spotify
    obsidian
    inputs.zen-browser.packages."${config.systemArch}".default
    font-awesome
    google-chrome
    chromium
    multiviewer-for-f1
    kitty
    lens
    orca-slicer
    freecad-wayland
    gimp3
  ];
}
