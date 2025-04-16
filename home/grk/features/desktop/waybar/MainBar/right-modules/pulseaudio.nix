{ ... }:
{
    programs.waybar.settings.mainbar = {
    "group/pulseaudio" = {
      orientation = "inherit";
      modules = [
        "pulseaudio#icon"
        "pulseaudio#label"
        # "pulseaudio/slider"
      ];
      # drawer = {
      #   click-to-reveal = false;
      #   transition-left-to-right = false;
      # };
    };
    "pulseaudio#icon" = {
      format = "{icon}";
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-right = "pavucontrol";
      format-icons = {
        default-muted = "󰖁";
        default = ["󰕿" "󰖀" "󰕾"];
      };
    };
    "pulseaudio#label" = {
      format = "{volume}%";
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-right = "pavucontrol";
    };
    "pulseaudio/slider" = {};
  };
  # services.polybar.settings."module/pulseaudio" = {
  #   type = "internal/pulseaudio";
  #   use-ui-max = false;
  #   interval = 5;
  #   format = {
  #     volume = {
  #       text = "%{T3}<ramp-volume>%{T-} %{T5}[%{T-}<bar-volume>%{T5}]%{T-}";
  #       overline = "\${colors.primary-40}";
  #       padding = 1;
  #     };
  #     muted = {
  #       text = "%{O7}%{T6}Volume Muted%{T-}";
  #       overline = "\${colors.background-alt}";
  #       padding = 1;
  #       prefix = "%{T3}󰖁%{T-}";
  #       foreground = "\${colors.alert}";
  #     };
  #   };
  #   bar-volume = {
  #     width = 9;
  #     indicator = {
  #       text = "%{T5}|%{T-}";
  #       foreground = "#fff";
  #     };
  #     fill = {
  #       text = "%{T4}─%{T-}";
  #     };
  #     empty = {
  #       text = "%{T4}─%{T-}";
  #       foreground = "\${colors.foreground-alt}";
  #     };
  #   };
  #   click-right = "pavucontrol";
  #   ramp-volume = ["󰕿" "󰖀" "󰕾"];
  # };
}