{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.bspwm;

in {
  options.modules.bspwm = { enable = mkEnableOption "bspwm"; };
  config = mkIf cfg.enable {
    xsession.windowManager.bspwm = {
      enable = true;
      package = pkgs.bspwm;
      monitors = {
        eDP-1 = [
          "󰣇" 
          "󰙯"
          ""
        ];
      };
      settings = {        
        focus_follows_pointer     = true;
        pointer_follows_monitor   = true;
        border_width              = 2;
        focused_border_color      = "#2a9dfb";
        window_gap                = 10;
        top_padding               = 25;
        split_ratio               = 0.5;
        borderless_monocle        = false;
        gapless_monocle           = true;
        single_monocle            = true;
        top_monocle_padding       = 10;
        pointer_modifier          = "mod4";
        pointer_action1           = "move";
        pointer_action2           = "resize_corner";
      };
    };
  };
}