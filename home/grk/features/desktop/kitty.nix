{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Hurmit Nerd Font Mono";
      package = pkgs.nerd-fonts.hurmit;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Brogrammer";
    settings = {
      enable_audio_bell = false;
    };
  };
}
