{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.zsh;

in {
    options.modules.zsh = { enable = mkEnableOption "zsh"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            htop
            iproute2
            toybox
            ncdu
            direnv
        ];
        programs.zsh = {
            enable = true;
            oh-my-zsh = {
                enable = true;
                theme = "agnoster";
                plugins = [
                    # "git"
                    # "zsh-autosuggestions"
                    # "zsh-syntax-highlighting"
                    "direnv"
                ];
            };
            plugins = [
                {
                    # will source zsh-autosuggestions.plugin.zsh
                    name = pkgs.zsh-autosuggestions.pname;
                    src = pkgs.zsh-autosuggestions.src;
                }
                {
                    name = pkgs.zsh-syntax-highlighting.pname;
                    src = pkgs.zsh-syntax-highlighting.src;
                }
            ];
            initExtra = ''
                macchina
            '';
        };
    };
}