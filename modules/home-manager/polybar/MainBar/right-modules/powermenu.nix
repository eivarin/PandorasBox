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
          exec = "systemctl reboot";
        }
        {
          text = "power off";
          exec = "systemctl poweroff";
        }
      ]
    ];
  };
}