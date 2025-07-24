{ ... }:
{
    programs.waybar.settings.mainbar = {
    "pulseaudio" = {
      format = "{icon} {volume}%";
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-right = "pavucontrol";
      format-icons = {
        default-muted = "󰖁";
        default = ["󰕿" "󰖀" "󰕾"];
        headphone = "󱡏";
        headphone-muted = "󱡐";
        headset = "󰋋";
        headset-muted = "󰟎";
        hdmi = "󰡁";
      };
    };
  };
}