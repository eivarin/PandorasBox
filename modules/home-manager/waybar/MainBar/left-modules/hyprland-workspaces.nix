{ ... }:
{
  programs.waybar.settings.mainbar = {
    "hyprland/workspaces" = {
      active-only = false;
      show-special = true;
      special-visible-only = true;
      # all-outputs = false;
      format = "{icon}{windows}";
      sort-by = "id";
      workspace-taskbar = {
        enable = true;
        icon-size = 16;
        
      };
      format-icons = {
        empty = "󱄅";
        default = "";
      };
      # persistent-workspaces = {};
      # show-special = false;
      # window-rewrite = {
      #   "zen" = "󰈹";
      #   "Spotify" = "";
      #   "discord" = "󰙯";
      #   "kitty" = "";
      #   "code" = "󰨞";
      # };
      # window-rewrite-default = "?";
      # format-window-separator = "<space>";
      # move-to-monitor = false;
      # ignore-workspaces = [];
    };
    "hyprland/language" = {
      format = "{}";
      format-pt = "PT";
      format-en = "US";
    };
  };
}