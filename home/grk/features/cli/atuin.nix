{ ... }:

{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      sync_address = "https://atuin.eivarin.xyz";
    };
    flags = [
      "--disable-up-arrow"
    ];
  };
}