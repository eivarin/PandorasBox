{ ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    cliphist = pkgs.callPackage ./cliphist { };
  };
}