{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    nixd
    pulseaudio
    greetd.regreet
  ];
}