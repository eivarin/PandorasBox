{ config, ... }:

{
  networking = {
    hostName = config.hostOptions.hostname;
    firewall.checkReversePath = false;
    networkmanager.enable = true;
  };
}