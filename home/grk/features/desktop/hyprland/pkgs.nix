{ pkgs, ... }:

let 
  wmBinds = pkgs.writeShellApplication {
    name = "wmBinds";
    runtimeInputs = [ pkgs.jq pkgs.hyprland ];
    text = builtins.readFile ./scripts/wmBinds.sh;
  };
in
{
  home.packages = with pkgs; [
    wev
    brightnessctl
    hyprpolkitagent
    grim
    slurp
    wl-clipboard
    cliphist
    wmBinds
  ];
}