{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.macchina;

in {
    options.modules.macchina = { enable = mkEnableOption "macchina"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [ macchina ];
        home.file.".config/macchina" = {
            source = ./.;
            recursive = true;
        };
    };
}