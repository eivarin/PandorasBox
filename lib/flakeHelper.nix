{
  lib,
  inputs,
  pkgsRepos,
  flakePackages ? {
    x86_64-linux = { };
    aarch64-linux = { };
  },
  defaults ? { },
  ...
}:

let
  home-manager = inputs."home-manager";
  flakePackagesOverlayModule =
    { config, ... }:
    {
      nixpkgs.overlays = [ (final: prev: prev // flakePackages.${config.systemArch}) ];
      nixpkgs.config = (import ./pkgRepoHelper.nix { }).defaultPkgRepoImportArgs;
    };
  importedPackagesReposFunc =
    systemArch:
    (import ./pkgRepoHelper.nix {
      inherit lib pkgsRepos;
      defaultSystem = systemArch;
    }).importedPackagesRepos;
in
rec {
  genNixOsConfig =
    hostname:
    { systemArch, ... }:
    lib.nixosSystem {
      system = systemArch;
      specialArgs = {
        inherit inputs hostname systemArch;
        otherPkgsRepos = importedPackagesReposFunc systemArch;
      };
      modules = [
        ../hosts/${hostname}/nixos-configuration.nix
        home-manager.nixosModules.default
        flakePackagesOverlayModule
      ];
    };
  genHomeManagerConfig =
    fullName:
    {
      systemArch,
      ...
    }:
    let
      importedPackagesRepos = importedPackagesReposFunc systemArch;
      pkgs = importedPackagesRepos.default;
      nameList = lib.strings.splitString "@" fullName;
      username = lib.lists.head nameList;
      hostname = lib.lists.last nameList;
    in
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        flakePackagesOverlayModule
        ../home/${username}/${hostname}.nix
      ];
      extraSpecialArgs = {
        inherit inputs hostname systemArch;
        otherPkgsRepos = importedPackagesRepos;
      };
    };
  genListOfConfigs = genFunction: configs: lib.mapAttrs genFunction (defaults // configs);

  genNixOsOutputs = configs: {
    nixosConfigurations = genListOfConfigs genNixOsConfig configs;
  };

  genHomeManagerOutputs = configs: {
    homeConfigurations = genListOfConfigs genHomeManagerConfig configs;
  };
}
