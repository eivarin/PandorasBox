{ pkgs, lib, config, hostOptions, ... }:

with lib;
let cfg = config.modules.copyq;

in {
  options.modules.copyq = { enable = mkEnableOption "copyq"; };
  config = mkIf cfg.enable {
    home.file.".config/copyq/copyq.conf" = {
      source = ./copyq;
      force = true;
    };
    services.copyq = {
      enable = true;
    };
  };
}