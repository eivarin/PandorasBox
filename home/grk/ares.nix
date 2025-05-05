{ ... }:
{
  imports = [
    ./global
    ./features/desktop
    ../../options/desktop
  ];

  hostname = "ares";
  systemArch = "x86_64-linux";

  wallpaper = ../../wallpapers/grk.png;

  monitors = [
    {
      name = "";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "auto";
      enabled = true;
      workspace = null;
    }
  ];
}