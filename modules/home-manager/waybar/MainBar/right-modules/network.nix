{ ... }:
{
  programs.waybar.settings.mainbar = {
    "network#ethernetIcon" = {
      interface = "en*";
      format = "{icon}";
      tooltip-format-ethernet = "{icon} if:{ifname} \n IP:{ipaddr}/{cidr} \n :{bandwidthDownBits} :{bandwidthUpBits} T:{bandwidthTotalBits}";
      tooltip-format-disconnected = "{icon} if:{ifname} disconnected";
      format-icons = {
        disconnected = "󰈂";
        linked = "!󰈁";
        ethernet = "󰈁";
      };
    };
    "network#ethernetLabel" = {
      interface = "en*";
      format = "{ifname}";
      format-disconnected = "";
      tooltip-format-ethernet = "{icon} if:{ifname} \n IP:{ipaddr}/{cidr} \n :{bandwidthDownBits} :{bandwidthUpBits} T:{bandwidthTotalBits}";
      tooltip-format-disconnected = "{icon} if:{ifname} disconnected";
      format-icons = {
        disconnected = "󰈂";
        linked = "!󰈁";
        ethernet = "󰈁";
      };
    };
    "network#wifiIcon" = {
      interface = "wl*";
      format = "{icon}";
      format-wifi = "{icon}";
      tooltip-format-wifi = "{icon} if:{ifname} SSID:{essid} \n IP:{ipaddr}/{cidr} \n :{bandwidthDownBits} :{bandwidthUpBits} T:{bandwidthTotalBits}";
      tooltip-format-disconnected = "{icon} if:{ifname} disconnected";
      format-icons = {
        wifi = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        disconnected = "󰤭";
        linked = "󰤭";
      };
    };
    "network#wifiLabel" = {
      interface = "wl*";
      format = "";
      format-wifi = "{essid:.10}";
      tooltip-format-wifi = "{icon} if:{ifname} SSID:{essid} \n IP:{ipaddr}/{cidr} \n :{bandwidthDownBits} :{bandwidthUpBits} T:{bandwidthTotalBits}";
      tooltip-format-disconnected = "{icon} if:{ifname} disconnected";
      format-icons = {
        wifi = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        disconnected = "󰤭";
        linked = "󰤭";
      };
    };

    "group/ethernet" = {
      orientation = "inherit";
      modules = [
        "network#ethernetIcon"
        "network#ethernetLabel"
      ];
    };
    "group/wifi" = {
      orientation = "inherit";
      modules = [
        "network#wifiIcon"
        "network#wifiLabel"
      ];
    };
  };
}