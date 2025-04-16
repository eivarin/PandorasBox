{ config, ... }:

{
  networking = {
    hostName = config.hostname;
    firewall.checkReversePath = false;
    networkmanager.enable = true;
  };
}