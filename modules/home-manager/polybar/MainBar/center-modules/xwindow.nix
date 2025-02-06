{ pkgs, lib, config, ... }:
{
  home.file.".config/polybar/scripts/scrollingTitle.sh" = {
    text = ''
      #!${pkgs.runtimeShell}
      ${pkgs.zscroll}/bin/zscroll --delay 0.2 -l 60 --match-command "${pkgs.xtitle}/bin/xtitle" --update-check true "${pkgs.xtitle}/bin/xtitle" &
      wait
    '';
    executable = true;
  };
  services.polybar.config = {
    "module/xwindow" = {
      type = "custom/script";
      exec = "~/.config/polybar/scripts/scrollingTitle.sh";
      tail = true;
    };
  };
}