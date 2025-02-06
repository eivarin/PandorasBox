{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.hermes = nixpkgs.lib.nixosSystem {
      specialArgs = {
        modulesConfig = {
          modules = {
            sxhkd.enable = true;
            git.enable = true;
            bspwm.enable = true;
            rofi.enable = true;
            polybar.enable = true;
            nm-applet.enable = true;
            picom.enable = true;
            betterlockscreen.enable = true;
          };
        };
        inherit inputs;
      };
      modules = [
        ./hosts/hermes/nixos-configuration.nix
        home-manager.nixosModules.default
      ];
    };
  };
}
