{ lib, ... }:

{
  options = {
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = "wallpaper to use";
    };
  };
}