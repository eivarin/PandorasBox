{ config, lib, ... }:
let
  ethernetConfig = {
    format = "{icon}{ifname}";
    format-disconnected = "{icon}";
    tooltip-format-ethernet = "{icon} if:{ifname} \n IP:{ipaddr}/{cidr} \n :{bandwidthDownBits} :{bandwidthUpBits} T:{bandwidthTotalBits}";
    tooltip-format-disconnected = "{icon} if:{ifname} disconnected";
    format-icons = {
      disconnected = "󰈂";
      linked = "!󰈁 ";
      ethernet = "󰈁 ";
    };
  };
  wifiConfig = {
    format = "{icon}";
    format-wifi = "{icon}{essid:.10}";
    tooltip-format-wifi = "{icon} if:{ifname} SSID:{essid} \n IP:{ipaddr}/{cidr} \n :{bandwidthDownBits} :{bandwidthUpBits} T:{bandwidthTotalBits}";
    tooltip-format-disconnected = "{icon} if:{ifname} disconnected";
    format-icons = {
      wifi = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
      disconnected = "󰤭";
      linked = "󰤭 ";
    };
  };
in
{
    programs.waybar.settings.mainbar = builtins.listToAttrs (
    lib.mapAttrsToList (iface: type: {
      name = "network#${iface}";
      value = lib.mkMerge [
        (if type == "wifi" then wifiConfig else ethernetConfig)
        { interface = iface; }
      ];
    }) config.waybar.networkInterfaces
  );
}