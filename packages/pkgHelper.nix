{
  defaultDerivationFile ? ./package.nix,
}:
(
  {
    pkgs,
    DerivationFile ? defaultDerivationFile,
    packageOverrides ? { },
    ...
  }:
  pkgs.callPackage DerivationFile packageOverrides
)
