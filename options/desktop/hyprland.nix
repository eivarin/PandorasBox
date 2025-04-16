{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.monitors = mkOption { type = types.listOf ( types.submodule {
    options = {
      name = mkOption {
        type = types.str;
        default = "Monitor";
        description = ''
          The name of the monitor. This is used to identify the monitor in
          the configuration.
        '';
      };
      primary = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether this monitor should be set as the primary monitor.
        '';
      };
      mode = mkOption {
        type = types.str;
        default = "auto";
        description = ''
          The mode of the monitor. This can be set to "auto" to automatically
          detect the mode based on the monitor's capabilities.
        '';
      };
      position = mkOption {
        type = types.str;
        default = "auto";
        description = ''
          The position of the monitor. This can be set to "auto" to
          automatically position the monitor based on its name.
          '';
      };
      scale = mkOption {
        type = types.float;
        default = 1.0;
        description = ''
          The scale of the monitor. This can be set to a float value to
          adjust the scaling of the monitor.
          '';
      };
      enabled = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Whether this monitor should be enabled.
        '';
      };
      workspace = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
          The workspace to assign to this monitor. This can be set to
          null to disable the workspace assignment.
          '';
      };
    };
  });
  };
}