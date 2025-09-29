{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.waybar = mkOption {
    type = types.submodule {
      options = {
        rightModules = mkOption {
          type = types.listOf types.str;
          default = [
            "network#ethernet"
            "group/perf"
            "pulseaudio"
            "group/powermenu"
          ];
          description = ''
            A list of modules to display on the right side of the Waybar.
            Each module can be a string representing the module name.
          '';
        };
        leftModules = mkOption {
          type = types.listOf types.str;
          default = [
            "hyprland/language"
            "hyprland/submap"
            # "mpris"
            "tray"
            "idle_inhibitor"
            "hyprland/workspaces"
          ];
          description = ''
            A list of modules to display on the left side of the Waybar.
            Each module can be a string representing the module name.
          '';
        };
        centerModules = mkOption {
          type = types.listOf types.str;
          default = [ "clock" ];
          description = ''
            A list of modules to display in the center of the Waybar.
            Each module can be a string representing the module name.
          '';
        };

        networkInterfaces = mkOption {
          type = types.attrsOf types.str;
          default = {
            eth0 = "ethernet";
            wlan0 = "wifi";
          };
          description = ''
            A set of network interfaces to monitor.
            Each key is the interface name, and the value is the type (e.g., "ethernet" or "wifi").
            This will be used to configure the network modules in Waybar.
          '';
        };

        batteryInterfaces = mkOption {
          type = types.listOf types.str;
          default = [ ];
          description = ''
            A list of battery interfaces to monitor.
            Each interface can be a string representing the battery name.
          '';
        };

        compactMode = mkOption {
          type = types.bool;
          default = false;
          description = ''
            Whether to enable compact mode for the Waybar.
            In compact mode, the bar will use less space and display fewer details.
          '';
        };

        barHeight = mkOption {
          type = types.int;
          default = 26; # Default icon size for the tray module
          description = ''
            The size of icons in the tray module.
            This can be adjusted to fit your preferences.
          '';
        };
      };
    };
  };
}
