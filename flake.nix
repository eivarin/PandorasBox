{
  description = "Nixos config flake";

  inputs = rec {
    # nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # nixpkgs-stable-small.url = "github:nixos/nixpkgs/nixos-25.05-small";

    nixos-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-unstable-small.url = "github:nixos/nixpkgs?ref=nixos-unstable-small";
    nixos-25.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixos-25-small.url = "github:nixos/nixpkgs?ref=nixos-25.05-small";

    nixpkgs = nixos-unstable;

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    flake-utils.url = "github:numtide/flake-utils";
    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      ...
    }@inputs:
    let
      pkgsRepos = {
        "default" = { input = inputs.nixos-unstable; };
        "unstable" = { input = inputs.nixos-unstable; };
        "unstable-small" = { input = inputs.nixos-unstable-small; };
        "25" = { input = inputs.nixos-25; };
        "25-small" = { input = inputs.nixos-25-small; };
      };
      packagesOutputs = import ./packages {
        flakeUtils = inputs.flake-utils;
        inherit pkgsRepos;
      };
      customLib = import ./lib {
        inherit inputs pkgsRepos;
        lib = inputs.nixpkgs.lib;
        flakePackages = packagesOutputs.packages;
      };
      flakeLib = customLib.lib.flakeHelper;
      nixosOutputs = flakeLib.genNixOsOutputs {
        ares = {
          systemArch = "x86_64-linux";
        };
        hermes = {
          systemArch = "x86_64-linux";
        };
      };
      homeManagerOutputs = flakeLib.genHomeManagerOutputs {
        "grk@ares" = {
          systemArch = "x86_64-linux";
        };
        "grk@hermes" = {
          systemArch = "x86_64-linux";
        };
      };
    in
    customLib
    //
    packagesOutputs
    // 
    nixosOutputs
    //
    homeManagerOutputs
    ;
}
