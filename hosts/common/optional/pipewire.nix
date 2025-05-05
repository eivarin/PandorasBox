{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];
  services.pipewire = {
    pulse.enable = true;
  };
}