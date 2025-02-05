{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.rofi;

in {
    options.modules.rofi = { enable = mkEnableOption "rofi"; };
    config = mkIf cfg.enable {
        home.pavckages = with pkgs; [ rofi ];
        home.file.".config/rofi" = {
            source = ./.;
            recursive = true;
        };
    };
}