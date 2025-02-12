{ pkgs, inputs, hostOptions, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    discord
    inputs.zen-browser.packages."${hostOptions.system}".beta
  ];
}