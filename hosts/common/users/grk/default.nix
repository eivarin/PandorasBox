# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, config, ... }:

{
  # imports = [
  #   import ../wpFunction.nix {
  #     inherit lib options;
  #     wp = ../../../../wallpapers/grk.png;
  #   }
  # ];
  users = {
    users.grk = {
      isNormalUser = true;
      description = "grk";
      extraGroups = [ "networkmanager" "wheel" "video" "docker" "dialout" ];
      shell = pkgs.zsh;
      packages = [ pkgs.home-manager ];
    };
  };

  

  home-manager.users.grk = import ../../../../home/grk/${config.hostname}.nix;
}
