{ ... }:

{
  fileSystems."/mnt/nfs" = {
    device = "10.0.2.8:/all";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
}