{ pkgs, lib, config, ... }:
{
  services.polybar.settings."module/powermenu" = {
    type = "custom/menu";
    expand.right= true;
    format-spacing = 1;

    label = {
      open = {
        text = "%{T3}%{T-}";
        foreground = "\${colors.primary}";
      };
      close = {
        text = "%{T3}%{T-}";
        foreground = "\${colors.primary}";
      };
      separator = {
        text = "|";
        foreground = "\${colors.foreground-alt}";
      };
    };
    menu = [
      [
        {
          text = "reboot";
          exec = "#powermenu.open.1";
        }
        {
          text = "power off";
          exec = "#powermenu.open.2";
        }
      ]
      [
        {
          text = "cancel";
          exec = "#powermenu.open.0";
        }
        {
          text = "reboot";
          exec = "sudo reboot";
        }
      ]
      [
        {
          text = "power off";
          exec = "sudo poweroff";
        }
        {
          text = "cancel";
          exec = "#powermenu.open.0";
        }
      ]
    ];
  };
}