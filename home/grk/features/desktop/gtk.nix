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
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "Tokyonight-Dark";
    platformTheme.name = "gtk3";
  };
}
