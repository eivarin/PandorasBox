{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:youwen5/zen-browser-flake";
    waybar-untested.url = "github:pol-rivero/Waybar/";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      hermes = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hermes/nixos-configuration.nix
          home-manager.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      "grk@hermes" = home-manager.lib.homeManagerConfiguration {
        modules = [./home/grk/hermes.nix];
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
