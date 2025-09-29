{ config, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      auth = {
        "pam:enabled" = true;
        "fingerprint:enabled" = config.home.fingerprint_auth or false;
      };
      background = {
        path = "screenshot";
        blur_passes = 4;
        blur_size = 4;
        vibrancy = 0.5;
        vibrancy_darkness = 0.5;
        brightness = 0.9;
      };
      input-field = {
          size = "20%, 5%";
          outline_thickness = 3;
          inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

          outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          check_color="rgba(00ff99ee) rgba(ff6633ee) 120deg";
          fail_color="rgba(ff6633ee) rgba(ff0066ee) 40deg";

          font_color = "rgb(143, 143, 143)";
          fade_on_empty = false;
          rounding = 15;

          position = "0, -20";
          halign = "center";
          valign = "center";
      };
      label = {
        text = ''
        cmd[update:1000] echo $(date "+%H:%M:%S %d-%m-%Y")
        cmd[update:1000] echo Welcome Back, $(whoami)
        '';
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 25;
        font_family = "Noto Sans";

        position = "0, 80";
        halign = "center";
        valign = "center";
      };
    };
  };
}
