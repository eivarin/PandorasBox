{ hostOptions, ... }:

{
    imports = [
        ./bspwm
        ./sxhkd
        ./polybar
        ./picom
        ./betterlockscreen
        ./copyq
    ];
    config = {
        modules = {
          sxhkd.enable = hostOptions.EnableGUI;
          bspwm.enable = hostOptions.EnableGUI;
          polybar.enable = hostOptions.EnableGUI;
          picom.enable = hostOptions.EnableGUI;
          betterlockscreen.enable = hostOptions.EnableGUI;
          # copyq.enable = hostOptions.EnableGUI;
          copyq.enable = false;
        };
    };
}