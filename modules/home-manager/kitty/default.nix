{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
  options.modules.kitty = { enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font ={
        name = "Hurmit Nerd Font Mono";
        package = pkgs.nerd-fonts.hurmit;
      };
      shellIntegration.enableZshIntegration = true;
      themeFile = "Brogrammer";
      settings = {
        enable_audio_bell = false;
      };
      };
  };
}