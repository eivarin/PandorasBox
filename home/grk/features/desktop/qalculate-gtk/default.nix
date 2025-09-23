{ pkgs, ...}:
{
  home.packages = with pkgs; [
    qalculate-gtk
  ];
  home.file.".config/qalculate/qalculate-gtk.cfg" = {
    source = ./qalculate-gtk.cfg;
    force = true;
  };
}