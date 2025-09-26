{ inputs, pkgs, ... }:
{
  imports = [ inputs.vscode-server.nixosModules.default ];
  services.vscode-server = {
    enable = true;
    extraRuntimeDependencies = with pkgs; [
      sops
      nixd
      alejandra
      nixfmt-rfc-style
      nixpkgs-fmt
    ];
  };
}
