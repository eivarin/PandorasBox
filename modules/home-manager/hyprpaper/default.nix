{ ... }:

{
  home.file.".config/wp.png" = {
    source = ../../../wp.png;
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
