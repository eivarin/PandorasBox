{ inputs, pkgs, config, ... }:

{
    imports = [
        ./git
        ./rofi
        ./bspwm
        ./sxhkd
    ];
}