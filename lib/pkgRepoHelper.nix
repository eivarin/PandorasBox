{
  lib ? {},
  defaultSystem ? "x86_64-linux",
  pkgsRepos ? {},
  ...
}:

rec {
  defaultPkgRepoImportArgs = {
    allowUnfree = true;
  };
  genConfiguredPackageRepo =
    {
      input,
      system ? defaultSystem,
      pkgRepoImportArgs ? { },
    }:
    import input (defaultPkgRepoImportArgs // { inherit system; } // pkgRepoImportArgs);
  genPackagesRepoSet =
    packageRepoSet:
    lib.mapAttrs (name: singlePackageRepo: genConfiguredPackageRepo singlePackageRepo) packageRepoSet;
  importedPackagesRepos = genPackagesRepoSet pkgsRepos;
}
