{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.picom;

in {
    options.modules.picom = { enable = mkEnableOption "picom"; };
    config = mkIf cfg.enable {
        services.picom = {
            enable = true;
        };
    };
}