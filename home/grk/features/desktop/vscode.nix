{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      ps: with ps; [
        nerd-fonts.fira-code
        iputils
        sops
        nixd
        alejandra
        nixfmt-rfc-style
        nixpkgs-fmt
        go
        gopls
        go-tools
        libgcc
      ]
    );
  };
}
