{ pkgs, lib, config, ... }:

{
    home.packages = with pkgs; [
        htop
        iproute2
        toybox
        gnugrep
        ncdu
        direnv
        jq
        fluxcd
        fzf
    ];
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "agnoster";
            plugins = [
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
        initContent = ''
            if [ -d "$HOME/.scripts" ] ; then
                PATH="$HOME/.scripts:$PATH"
            fi
            . <(flux completion zsh)
            macchina
        '';
        shellAliases = {
            poweroff = "systemctl poweroff";
            reboot = "systemctl reboot";
        };
    };
}