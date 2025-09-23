{ inputs, ... }:

{
  imports = [ inputs.nvf.homeManagerModules.default ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "tokyonight";
        style = "night";
      };
      viAlias = true;
      vimAlias = true;
      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
      };
      treesitter = {
        enable = true;
        highlight = {
          enable = true;
        };
      };
      telescope = {
        enable = true;
      };
      languages = {
        go.enable = true;
        nix.enable = true;
        python.enable = true;
        bash.enable = true;
        yaml.enable = true;
      };
    };
  };
}
