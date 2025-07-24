{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ventoy-bin
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.05"
  ];
}
