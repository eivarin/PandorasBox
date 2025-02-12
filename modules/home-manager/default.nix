{ hostOptions, ... }:

{
    # options = {
    #     EnableGUI = lib.mkOption {
    #         type = lib.types.bool;
    #         default = false;
    #         description = "Enable GUI modules";
    #     };
    # };
    imports = [
        ./git
        ./rofi
        ./bspwm
        ./sxhkd
        ./polybar
        ./nm-applet
        ./picom
        ./betterlockscreen
        ./zsh
        ./kitty
        ./macchina
        ./vscode
        ./copyq
        ./dunst
        ./blueman-applet
    ];
    config = {
        modules = {
            zsh.enable = true;
            git.enable = true;
            macchina.enable = true;

            sxhkd.enable = hostOptions.EnableGUI;
            bspwm.enable = hostOptions.EnableGUI;
            rofi.enable = hostOptions.EnableGUI;
            polybar.enable = hostOptions.EnableGUI;
            nm-applet.enable = hostOptions.EnableGUI;
            picom.enable = hostOptions.EnableGUI;
            betterlockscreen.enable = hostOptions.EnableGUI;
            kitty.enable = hostOptions.EnableGUI;
            vscode.enable = hostOptions.EnableGUI;
            copyq.enable = hostOptions.EnableGUI;
            dunst.enable = hostOptions.EnableGUI;
            blueman-applet.enable = hostOptions.EnableGUI;
        };
    };
}