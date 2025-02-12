{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.polybar;

in {
    options.modules.polybar = { enable = mkEnableOption "polybar"; };
    imports = [
        ./colors.nix
        ./fonts.nix
        ./MainBar
    ];
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            zscroll
            xtitle
            nerd-fonts.hurmit
            pkgs.polybarFull
            toybox
        ];
        # home.file.".config/polybar/scripts" = {
        #     source = ./scripts;
        #     executable = true;
        #     recursive = true;
        # };
        services.polybar = {
            enable = true;
            script = "sleep 1; polybar Main &";
            package = pkgs.polybarFull;
        };
        systemd.user.services.polybar = {
            Install.WantedBy = [ "graphical-session.target" ];
        };
    };
}