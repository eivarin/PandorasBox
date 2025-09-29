{ lib, ... }:

{
  options = {
    fingerprint_auth = lib.mkOption {
      type = lib.types.bool;
      description = "Enable fingerprint authentication.";
    };
  };
}