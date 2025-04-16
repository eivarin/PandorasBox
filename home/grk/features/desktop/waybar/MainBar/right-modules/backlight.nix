{ ... }:
{
  programs.waybar.settings.mainbar = {
    "group/backlight" = {
      orientation = "inherit";
      modules = [
        "backlight#icon"
        "backlight#label"
        # "backlight/slider"
      ];
      # drawer = {
      #   click-to-reveal = false;
      #   transition-left-to-right = false;
      # };
    };
    "backlight#icon" = {
      format = "{icon}";
      format-icons = ["󱩏" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖"];
      on-click = "brightnessctl set +5%";
      on-click-right = "brightnessctl set 5%-";
    };
    "backlight#label" = {
      format = "{percent}%";
      on-click = "brightnessctl set +5%";
      on-click-right = "brightnessctl set 5%-";
    };
    "backlight/slider" = {};
  };
  # services.polybar.settings."module/backlight" = {
  #   type = "internal/backlight";
  #   enable-scroll = true;
  #   scroll-interval = 10;
  #   format = {
  #     text = "%{T3}<ramp>%{T-}%{O2}:<label>";
  #     overline = "\${colors.primary-60}";
  #     padding = 1;
  #   };
  #   ramp = {
  #     text = ["󱩏" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖"];
  #     foreground = "\${colors.foreground-alt}";
  #   };
  # };
}