{
  flakeUtils,
  pkgsRepos,
  ...
}:
let
  lib = pkgsRepos.default.input.lib;
in
flakeUtils.lib.eachDefaultSystem (
  defaultSystem:
  let
    pkgRepoHelper = import ../lib/pkgRepoHelper.nix { inherit lib defaultSystem; };
    importedPkgRepos = pkgRepoHelper.genPackagesRepoSet pkgsRepos;
    defaultPkgs = importedPkgRepos.default;

    packagesToDefine =
      (lib.mapAttrs (dir: _: { pkgs = defaultPkgs; }) (
        lib.filterAttrs (name: type: type == "directory") (builtins.readDir ./.)
      ))
      // {
        # config specific packages
      };

    mapFunc = pkgDir: args: import ./${pkgDir} args;
  in
  {
    packages = lib.mapAttrs mapFunc packagesToDefine;
  }
)
