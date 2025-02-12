{ ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,pt";
      options = "eurosign:e, compose:menu, grp:alt_space_toggle";
    };
    displayManager.lightdm = {
      enable = true;
      greeters.enso.enable = true;
      background = ../../../wp.png ;
    };
    windowManager.bspwm.enable = true;
  };
}