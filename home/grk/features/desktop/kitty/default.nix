{ pkgs, ... }:

{
  home.file.".config/kitty/MainTerminal.session" = {
    source = ./MainTerminal.session;
  };
  home.file.".config/kitty/commonScripts.yml" = {
    source = ./commonScripts.yml;
  };
  programs.kitty = {
    enable = true;
    font = {
      name = "Hurmit Nerd Font Mono";
      package = pkgs.nerd-fonts.hurmit;
    };
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Brogrammer";
    settings = {
      enable_audio_bell = false;
      allow_remote_control = true;
      notify_on_cmd_finish = "unfocused 20.0 notify";
      tab_bar_style = "powerline";
    };
    extraConfig = ''
      mouse_map middle release ungrabbed paste_from_selection
      mouse_map right press grabbed,ungrabbed discard_event
      mouse_map right click grabbed,ungrabbed copy_to_clipboard
    '';
  };
}