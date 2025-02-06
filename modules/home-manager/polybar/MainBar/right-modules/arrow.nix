{ pkgs, lib, config, ... }:
{
  services.polybar.settings."module/" = {
# [module/arrow]
# type = custom/text
# format = Open
# format-prefix = %{T2}⬤ %{T-}
# format-suffix = %{T2} ⬤%{T-}
# format-overline = ${colors.primary-80}
# format-padding = 1

# click-left = ps -ef | grep ' polybar Secondary -r$' || polybar Secondary -r &

  };
}