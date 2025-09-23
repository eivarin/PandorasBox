{ ... }:

{
  # wayland.windowManager.hyprland.extraConfig = ''
  #   bind = CTRL, Escape, submap, 

  #   submap = 

  #   bind = , F1, exec, playerctl previous && playerctl-notify
  #   bind = , F2, exec, playerctl play-pause && playerctl-notify
  #   bind = , F3, exec, playerctl next && playerctl-notify

  #   bind = , F4, exec, cycle-pipewire-sync
  #   bind = , F5, exec, pactl set-sink-volume $(pactl info | grep 'Default Sink' | cut -d':' -f2 | tr -d ' ') -5%
  #   bind = , F6, exec, pactl set-sink-volume $(pactl info | grep 'Default Sink' | cut -d':' -f2 | tr -d ' ') +5%

  #   bind = , F7, exec, brightnessctl set -5%
  #   bind = , F8, exec, brightnessctl set +5%

  #   bind = , catchall, submap, reset

  #   submap = reset
  # '';
}
