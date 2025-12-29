{
  inputs,
  pkgs,
  config,
  ...
}:
{
  home.packages = [
    inputs.rofi-nix.packages."${config.systemArch}".default
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {
      plugins = [
        pkgs.rofi-vpn
        pkgs.rofi-top
        pkgs.rofi-bluetooth
        pkgs.rofi-power-menu
        pkgs.rofi-emoji
      ];
    };
    theme = ./rounded-nord-dark.rasi;
    extraConfig = {
      show-icons = true;
    };
  };
}
