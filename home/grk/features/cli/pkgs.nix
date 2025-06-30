{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xh
    inetutils
    dig
  ];
}