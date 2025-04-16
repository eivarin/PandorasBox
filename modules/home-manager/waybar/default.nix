{ lib, config, inputs, hostOptions, ... }:

with lib;
let cfg = config.modules.waybar;

in {
  options.modules.waybar = { 
    enable = mkEnableOption "waybar";
  };
  imports = [
    ./style.nix
    ./MainBar
  ];
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      package = inputs.waybar-untested.packages."${hostOptions.system}".waybar;
    };
  };
}