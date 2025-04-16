{ hostOptions, monitors, ... }:

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
        ./nm-applet
        ./zsh
        ./kitty
        ./macchina
        ./vscode
        ./dunst
        ./blueman-applet
        ./gh
        ./gtk

        # ./x.nix
        ./wayland.nix

        ./pkgs
    ];
    config = {
        modules = {
            zsh.enable = true;
            git.enable = true;
            macchina.enable = true;
            gh.enable = true;

            rofi.enable = hostOptions.EnableGUI;
            kitty.enable = hostOptions.EnableGUI;
            vscode.enable = hostOptions.EnableGUI;
            dunst.enable = hostOptions.EnableGUI;
            blueman-applet.enable = hostOptions.EnableGUI;
            gtk.enable = hostOptions.EnableGUI;
            nm-applet.enable = hostOptions.EnableGUI;
        };
        monitors = monitors;
    };
}