{ pkgs, ... }:

{
  services.xserver = {
    enable = false;
    xkb = {
      layout = "us,pt";
      options = "eurosign:e, compose:menu, grp:alt_space_toggle";
    };
    displayManager.lightdm = {
      enable = false;
      greeters.enso = { 
        enable = true;
        cursorTheme.name = "Vimix-Cursors";
        cursorTheme.package = pkgs.vimix-cursors;
      };
      background = ../../../wp.png ;
    };
    windowManager.bspwm.enable = false;
  };
}