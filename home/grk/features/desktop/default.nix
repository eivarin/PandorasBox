{ ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./blueman-applet.nix
    ./dunst.nix
    ./games.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./kitty.nix
    ./nm-applet.nix
    ./pkgs.nix
    ./vscode.nix
    ./wofi.nix
    ../../../../options/desktop
  ];
}