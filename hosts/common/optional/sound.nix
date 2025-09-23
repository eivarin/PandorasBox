{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}