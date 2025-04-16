{ lib, config, pkgs, ... }:

with lib;
let cfg = config.modules.gtk;

in {
    options.modules.gtk = { enable = mkEnableOption "gtk"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        nautilus
      ];
      home.pointerCursor = {
        name = "Vimix-cursors";
        package = pkgs.vimix-cursors;
        size = 16;
        gtk.enable = true;
        hyprcursor = {
          enable = true;
        };
      };
      
      gtk = {
        enable = true;
        theme = {
          package = pkgs.vimix-gtk-themes;
          name = "vimix-dark-doder";
        };
        iconTheme = {
          package = pkgs.vimix-icon-theme;
          name = "Vimix-doder-dark";
        };
      };
    };
}