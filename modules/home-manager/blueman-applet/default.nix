{ lib, config, ... }:

with lib;
let cfg = config.modules.blueman-applet;

in {
  options.modules.blueman-applet = { enable = mkEnableOption "blueman-applet"; };
  config = mkIf cfg.enable {
    services.blueman-applet = {
      enable = true;
    };
  };
}