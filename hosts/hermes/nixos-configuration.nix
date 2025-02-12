{  inputs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/options
    ../../modules/nixos
    ../../users/grk
  ];
  hostOptions = {
    hostname = "hermes";
    system = "x86_64-linux";
    EnableGUI = true;
    monitors = [
      {
        name = "eDP-1";
        desktops = [
          "󱄅"
          "󰙯"
          ""
        ];
      }
    ];
  };
}
