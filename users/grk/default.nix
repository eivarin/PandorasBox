# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, modulesConfig, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.grk = {
    isNormalUser = true;
    description = "grk";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = { 
      inherit inputs; 
      inherit modulesConfig;
    };
    users = {
      "grk" = import ./home.nix;
    }; 
  };
}
