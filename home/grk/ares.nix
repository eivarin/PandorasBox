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
      name = "DP-1";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "0x1080";
      enabled = true;
      workspace = null;
    }
    {
      name = "DP-2";
      primary = false;
      mode = "highrr";
      scale = 1.0;
      position = "1920x1080";
      enabled = true;
      workspace = null;
    }
    {
      name = "HDMI-A-3";
      primary = false;
      mode = "highres";
      scale = 1.0;
      position = "1920x0";
      enabled = true;
      workspace = null;
    }
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