{ inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./docker.nix
    ./locale.nix
    ./network.nix
    ./networkFS.nix
    ./nix.nix
    ./openssh.nix
    ./pkgs.nix
    ./zsh.nix

    ../../../options/global
    ../../../packages
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { 
      inherit inputs outputs;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  system.stateVersion = "24.11";
  time.timeZone = "Europe/Lisbon";
}
