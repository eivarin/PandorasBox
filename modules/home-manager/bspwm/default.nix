{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.bspwm;

in {
    options.modules.bspwm = { enable = mkEnableOption "bspwm"; };
    config = mkIf cfg.enable {
      xsession.windowManager.bspwm = {
        enable = true;
        package = pkgs.bspwm;
      };
    };
}