{ ... }:
{
  programs.waybar.settings.mainbar = {
    "group/clock" = {
      orientation = "inherit";
      modules = [
        "custom/clockIcon"
        "clock"
      ];
    };
    "custom/clockIcon" = {
      format = "";
    };
    clock = {
      format = "{:%H:%M}";
      format-alt = "{:%A, %B %d, %Y (%R)}";
      tooltip-format= "<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "year";
        mode-mon-col = 3;
        weeks-pos = "right";
        on-scroll = 1;
        format = {
          months   = "<span color='#ffead3'><b>{}</b></span>";
          days     = "<span color='#ecc6d9'><b>{}</b></span>";
          weeks    = "<span color='#99ffdd'><b>W{}</b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          today    = "<span color='#ff6699'><b><u>{}</u></b></span>";
        };
      };
      actions = {
        on-click-right = "mode";
        # on-scroll-up   = "tz_up";
        # on-scroll-down = "tz_down";
        on-scroll-up   = "shift_up";
        on-scroll-down = "shift_down";
      };
    };
  };
}