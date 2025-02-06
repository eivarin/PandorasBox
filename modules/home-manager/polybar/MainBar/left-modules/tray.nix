{ pkgs, lib, config, ... }:
{
  services.polybar.settings."module/tray" = {
    type = "internal/tray";
    tray-padding = 2;
  };
}