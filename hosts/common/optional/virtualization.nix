{ ... }:

{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["grk"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;


}
