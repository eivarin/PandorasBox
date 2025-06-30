{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    vimix-cursors
    phinger-cursors
  ];
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 16;
    gtk.enable = true;
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
}