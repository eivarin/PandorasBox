{ ... }:
{
  imports = [
    ./global
    ./features/desktop
    ../../options/desktop
  ];

  systemArch = "x86_64-linux";

  wallpaper = ../../wallpapers/grk.png;

  monitors = [
    {
      name = "eDP-1";
      primary = true;
      mode = "preferred";
      position = "auto";
      scale = 1.0;
      enabled = true;
      workspace = null;
    }
    {
      name = "";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "auto-up";
      enabled = true;
      workspace = null;
    }
  ];
}