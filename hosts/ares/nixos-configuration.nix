{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    
    ../common/global
    ../common/users/grk

    ../common/optional/backlight.nix
    ../common/optional/blueman.nix
    # ../common/optional/bluetooth.nix
    ../common/optional/boot.nix
    ../common/optional/dconf.nix
    ../common/optional/greetd.nix
    ../common/optional/hyprland.nix
    ../common/optional/libinput.nix
    ../common/optional/pipewire.nix

    ../../options/desktop

    
    # inputs.home-manager.nixosModules.default
    # ../../modules/options
    # ../../modules/nixos
    # ../../users/grk
    # ../../options
  ];

  hostname = "hermes";
  systemArch = "x86_64-linux";

}
