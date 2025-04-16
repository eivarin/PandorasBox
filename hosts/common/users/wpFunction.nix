{lib, options, wp}:
lib.optionalAttrs (options?system) { 
  wallpaper = wp;
}