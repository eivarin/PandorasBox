{ lib, ... }:

{
  options = {
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "hermes";
      description = "System Hostname";
    };
    systemArch = lib.mkOption {
      type = lib.types.str;
      default = "x86_64-linux";
      description = "System type";
    };
  };
}