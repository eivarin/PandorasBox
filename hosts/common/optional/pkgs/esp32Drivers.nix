{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cp210x-program
    esptool
  ];
}
