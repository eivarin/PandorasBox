{ ... }:

{
  programs.waybar.style = ''

button {
  padding: 0;
  border-radius: 0;
}

window#waybar {
  border-radius: 8px;
}
window#waybar > box {
  padding: 0 10px;
}


#custom-poweroff {
  color: #ff0000;
}

#custom-reboot {
  color: #ffff00;
  padding: 0 5px;
}
#custom-lock {
  color: #0000ff;
}

#battery.bat0icon, #battery.bat1icon, #pulseaudio.icon, #backlight.icon, #custom-clockIcon, #custom-poweroff, #custom-reboot, #custom-lock, #network.wifiIcon, #network.ethernetIcon, #custom-cpuIcon, #custom-memoryIcon, #custom-diskIcon {
  font-size: 16px;
}

#battery.bat0icon, #battery.bat1icon, #pulseaudio.icon, #backlight.icon, #custom-clockIcon, #network.wifiIcon, #network.ethernetIcon, #custom-cpuIcon, #custom-memoryIcon, #custom-diskIcon {
  padding: 0 3px;
}

#battery.bat0label, #battery.bat1label, #pulseaudio.label, #backlight.label , #clock.horizontal, #network.wifiLabel, #network.ethernetLabel, #cpu, #memory, #disk {
  padding-right: 3px;
  padding-top: 3px;
}

#custom-clockIcon {
  margin-top: -3px;
}

#battery.full {
  border-top: 2px solid #00ff00
}
#battery.good {
  border-top: 2px solid #b3ff00
}
#battery.medium {
  border-top: 2px solid #ffff00
}
#battery.warning {
  border-top: 2px solid #ff5e00
}
#battery.critical {
  border-top: 2px solid #ff0000
}

#workspaces button{
  padding: 0 4px;
  border-top: 2px solid #0070ff;
  color: @text;
  margin: 0 4px;
}

#workspaces button.empty label{
  font-size: 16px;
}

#workspaces button.active {
  border-top: 2px solid #104c7e;
}

#workspaces button.visible.special {
  border-top: 2px solid #fb6c2a;
}

#workspaces button.visible {
  border-top: 2px solidrgb(0, 255, 55);
  background-color: rgba(255, 255, 255, 0.1);
}

#workspaces button.urgent {
  background-color: #ff0000;
}

#cpuGroup {
  border-top: 2px solid #ff9462;
}

#memoryGroup {
  border-top: 2px solid #fb6c2a;
}

#diskGroup {
  border-top: 2px solid #db4500;
}

#clock.horizontal {
  border-top: 2px solid #efff62;
}

#network {
  border-top: 2px solid #ff0000;
}

#network.ethernet.disconnected, #network.disabled {
  border-top: 2px solid #ff0000;
}

#network.linked {
  border-top: 2px solid #ffff00;
}

#network.ethernet {
  border-top: 2px solid #00ff00;
}

#network.wifi {
  border-top: 2px solid #00ff00;
}


#pulseaudio.horizontal {
  border-top: 2px solid rgb(0, 255, 191);
}

#backlight.horizontal {
  border-top: 2px solid rgb(0, 204, 255);
}



* {
  font-family: "Hurmit Nerd Font Propo";
  font-size: 12px;
}
'';
}

# #pulseaudio.module, #backlight.horizontal {
#   padding: 0 5px;
# }
# #pulseaudio-slider, #backlight-slider {
#   min-height: 0px;
#   min-width: 0px;
#   padding-left: 5px;
# }

# #pulseaudio-slider slider, #backlight-slider slider {
#   min-height: 0px;
#   min-width: 0px;
#   background-size: 20px;
#   background-image: none;
#   margin: -8px;
# }
# #pulseaudio-slider trough, #backlight-slider trough {
#   min-height: 3px;
#   min-width: 80px;
#   background-color: red;
# }
# #pulseaudio-slider highlight, #backlight-slider highlight {
#   min-height: 3px;
#   min-width: 0px;
#   background-color: green;
# }