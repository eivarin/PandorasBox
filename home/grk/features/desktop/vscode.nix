{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    vscode-fhs
  ];
}