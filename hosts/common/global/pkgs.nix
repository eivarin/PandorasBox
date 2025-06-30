{ pkgs, ... }:

{
  # nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    cp210x-program
    esptool   
  ];
}