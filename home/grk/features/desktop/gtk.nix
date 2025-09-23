{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vimix-cursors
    phinger-cursors
    nordzy-icon-theme
  ];
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 16;
    gtk.enable = true;
  };
  dconf.settings = {
    "org.gnome.desktop.interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
      # package = pkgs.nordic;
      # name = "Nordic";
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}