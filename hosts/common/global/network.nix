{ config, pkgs,... }:

{
  networking = {
    hostName = config.hostname;
    firewall.checkReversePath = false;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [ networkmanager-openvpn ];
    };
  };
}
