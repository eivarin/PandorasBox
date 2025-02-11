{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.hermes = nixpkgs.lib.nixosSystem {
      specialArgs = {
        system = "x86_64-linux";
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
            zsh.enable = true;
            kitty.enable = true;
            macchina.enable = true;
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
