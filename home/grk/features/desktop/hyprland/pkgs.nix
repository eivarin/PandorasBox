{ pkgs, ... }:

let 
  wmBinds = pkgs.writeShellApplication {
    name = "wmBinds";
    runtimeInputs = [ pkgs.jq pkgs.hyprland ];
    text = builtins.readFile ./scripts/wmBinds.sh;
  };
  bitwarden-resize-script = pkgs.writeShellApplication {
    name = "bitwarden-resize-script";
    runtimeInputs = [ pkgs.jq pkgs.yq pkgs.hyprland pkgs.socat ];
    text = builtins.readFile ./scripts/bitwarden-resize-script.sh;
  };
in
{
  home.packages = with pkgs; [
    wev
    brightnessctl
    grim
    slurp
    wl-clipboard
    cliphist
    ripgrep
    imagemagick
    wmBinds
    bitwarden-resize-script
  ];
}