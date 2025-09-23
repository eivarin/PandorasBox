{ ... }:


let
  nixpkgsConf = ''
{
  allowUnfree = true;
}
'';
in
{
  xdg.configFile."nixpkgs/config.nix" = {
    enable = true;
    text = nixpkgsConf;
  };
}