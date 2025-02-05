{ config, pkgs, modulesConfig, ... }:

{
  imports = [
    ./home-configuration.nix
    ../../modules/home-manager
  ];
  config = modulesConfig;
}
