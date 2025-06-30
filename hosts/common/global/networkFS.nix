{ ... }:

{
  # e1
  fileSystems."/mnt/nfs" = {
    device = "10.2.0.8:/all";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
}

