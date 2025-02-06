{ inputs, pkgs, config, ... }:

{
    imports = [
        ./git
        ./rofi
        ./bspwm
        ./sxhkd
        ./polybar
        ./nm-applet
        ./picom
        ./betterlockscreen
    ];
}