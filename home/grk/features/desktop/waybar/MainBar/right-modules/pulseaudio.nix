{ config, ... }:
{
  programs.waybar.settings.mainbar = {
    "group/pulseaudioGrp" = {
      orientation = "inherit";
      modules = [
        "pulseaudio"
        (if config.waybar.compactMode then "" else "pulseaudio/slider")
      ];
    };
    "pulseaudio" = {
      format = if config.waybar.compactMode then "{icon} {volume}%" else "{icon}";
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-right = "pavucontrol";
      format-icons = {
        default-muted = "󰖁";
        default = [
          "󰕿"
          "󰖀"
          "󰕾"
        ];
        headphone = "󱡏";
        headphone-muted = "󱡐";
        headset = "󰋋";
        headset-muted = "󰟎";
        hdmi = "󰡁";
      };
    };
  };
}
