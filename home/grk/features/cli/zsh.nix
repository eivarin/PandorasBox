{ pkgs, lib, config, ... }:


let
    zshConfigEarlyInit = lib.mkOrder 500 ''
        if [ -d "$HOME/.scripts" ] ; then
            PATH="$HOME/.scripts:$PATH"
        fi
        . <(flux completion zsh)
    ''; 
    zshConfig = lib.mkOrder 1000 ''

    ''; 
    zshConfigLateInit = lib.mkOrder 1500 ''
        macchina
        if [[ $1 == eval ]]
        then
            "$@"
        set --
        fi
    '';
in
{
    home.packages = with pkgs; [
        htop
        iproute2
        toybox
        gnugrep
        ncdu
        direnv
        jq
        yq
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
        initContent = lib.mkMerge [ zshConfigEarlyInit zshConfig zshConfigLateInit ];
        shellAliases = {
            poweroff = "systemctl poweroff";
            reboot = "systemctl reboot";
            nr = "f() { nix run nixpkgs#$@ };f";
            ns = "f() { nix shell nixpkgs#$@ };f";
        };
    };
}