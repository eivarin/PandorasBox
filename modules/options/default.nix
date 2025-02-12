{ lib, ... }:

{
  options = {
    hostOptions = {
      hostname = lib.mkOption {
        type = lib.types.str;
        default = "nixos";
        description = "Hostname";
      };
      system = lib.mkOption {
        type = lib.types.str;
        default = "x86_64-linux";
        description = "System type";
      };
      EnableGUI = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable GUI modules";
      };
      monitors = lib.mkOption {
        type = lib.types.listOf (
          lib.types.submodule {
            options = {
              name = lib.mkOption {
                type = lib.types.str;
                default = "HDMI-1";
                description = "Monitor name";
              };
              desktops = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ "󱄅" ];
                description = "Desktops";
              };
            };
          }
        );
      };
    };
  };
}