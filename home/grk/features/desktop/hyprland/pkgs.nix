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
  cycle-pipewire-sync = pkgs.writeShellApplication {
    name = "cycle-pipewire-sync";
    runtimeInputs = [ pkgs.pulseaudio pkgs.libnotify  ];
    text = builtins.readFile ./scripts/cycle-pipewire-sync.sh;
  };
  playerctl-notify = pkgs.writeShellApplication {
    name = "playerctl-notify";
    runtimeInputs = [ pkgs.playerctl pkgs.libnotify  ];
    text = builtins.readFile ./scripts/playerctl-notify.sh;
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
    cycle-pipewire-sync
    playerctl-notify
    hyprpicker
  ];
}