{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xh
    inetutils
    dig
    tldr
    borgbackup
    n
  ];
}