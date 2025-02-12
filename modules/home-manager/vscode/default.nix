{ lib, config, pkgs, ... }:

with lib;
let cfg = config.modules.vscode;

in {
    options.modules.vscode = { enable = mkEnableOption "vscode"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            nerd-fonts.fira-code
            vscode-fhs
        ];
    };
}