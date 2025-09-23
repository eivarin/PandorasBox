{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      (if config.hostname == "ares" then vpl-gpu-rt else null)
    ];
  };
}
