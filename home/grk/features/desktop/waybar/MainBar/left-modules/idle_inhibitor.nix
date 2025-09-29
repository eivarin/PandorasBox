{ ... }:
{
  programs.waybar.settings.mainbar."idle_inhibitor" = {
    format = "{icon}";
    format-icons = {
        activated = "";
        deactivated = "";
    };
  };
}
