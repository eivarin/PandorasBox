{ lib, ... }@libArgs:

let
  ls = builtins.readDir ./.;
  foldlFunc =
    res: name: value:
    let
      fixedName = if value == "regular" then (lib.strings.removeSuffix ".nix" name) else name;
      newMember = if name != "default.nix" then { "${fixedName}" = import ./${name} libArgs; } else { };
    in
    (res // newMember);
in
{
  lib = lib.foldlAttrs foldlFunc { } ls;
}


