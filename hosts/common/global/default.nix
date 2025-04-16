{ inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./network.nix
    ./networkFS.nix
    ./nix.nix
    ./openssh.nix
    ./pkgs.nix
    ./zsh.nix

    ../../../options/global
  ];

  home-manager = {
  #  useGlobalPkgs = true;
    extraSpecialArgs = { 
      inherit inputs outputs;
    };
  };

  system.stateVersion = "24.11";
  time.timeZone = "Europe/Lisbon";
}
