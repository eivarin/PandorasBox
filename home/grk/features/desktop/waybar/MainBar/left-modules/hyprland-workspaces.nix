{ config, ... }:
{
  programs.waybar.settings.mainbar = {
    "hyprland/workspaces" = {
      active-only = false;
      show-special = true;
      special-visible-only = true;
      format-window-separator = "";
      sort-by = "number";
      format = "{icon}{windows}";
      workspace-taskbar = {
        enable = true;
        icon-theme = "default";
        icon-size = config.waybar.barHeight - 12;
        format = if config.waybar.compactMode then "{icon}" else "{icon} {title:.20}";
        update-active-window = true;
        on-click-window = "wmBinds SwitchToWindow {address} {button}";
      };
      format-icons = {
        default = ":"; 
        empty = "";
        special = "";
      };
    };
    "hyprland/language" = {
      format = "{}";
      format-pt = "🇵🇹";
      format-en = "🇺🇸";
    };
  };
}