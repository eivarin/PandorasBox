{ lib, config, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        origin = "bottom-center";
      };
    };
  };
}