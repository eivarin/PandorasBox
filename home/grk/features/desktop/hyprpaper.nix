{ config, ... }:

{
  home.file.".config/wp.png" = {
    source = config.wallpaper;
    force = true;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = "false";
      splash_duration = "2";
      preload = ["~/.config/wp.png"];
      wallpaper = [",~/.config/wp.png"];
    };
  };
}
