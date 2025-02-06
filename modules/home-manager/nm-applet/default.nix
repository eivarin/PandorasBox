{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nm-applet;

in {
    options.modules.nm-applet = { enable = mkEnableOption "nm-applet"; };
    config = mkIf cfg.enable {
        services.network-manager-applet.enable = true;
    };
}