{ ... }:
{
  programs.waybar.settings.mainbar = {
    "group/powermenu" = {
      orientation = "inherit";
      modules = [
        "custom/poweroff"
        "custom/lock"
        "custom/reboot"
      ];
      drawer = {
        click-to-reveal = false;
        transition-left-to-right = false;
      };
    };
    "custom/poweroff" = {
      format = "⏻";
      on-click = "systemctl poweroff";
      tooltip = "Power Off";
    };
    "custom/reboot" = {
      format = "";
      on-click = "systemctl reboot";
      tooltip = "Reboot";
    };
    "custom/lock" = {
      format = "󰌾";
      on-click = "hyprlock";
      tooltip = "Lock";
    };
  };
}