# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.grk = {
    isNormalUser = true;
    description = "grk";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    # packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { 
      inherit inputs;
      monitors = config.monitors;
      hostOptions = config.hostOptions;
    };
    users = {
      "grk" = {
        imports = [
          ../../options
          ../../modules/home-manager
          ./home-configuration.nix
        ];
      };
    }; 
  };
}
