{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
    options.modules.kitty = { enable = mkEnableOption "kitty"; };
    config = mkIf cfg.enable {
        home.file.".config/kitty/theme.conf" = {
            source = ./theme.conf;
        };
        programs.kitty = {
            enable = true;
            font ={
                name = "Hurmit Nerd Font Mono";
                package = pkgs.nerd-fonts.hurmit;
            };
            shellIntegration.enableZshIntegration = true;
            extraConfig = ''
                include ./theme.conf
                bold_font        auto
                italic_font      auto
                bold_italic_font auto
                enable_audio_bell no
            '';
        };
    };
}