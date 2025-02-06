{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.sxhkd;

in {
    options.modules.sxhkd = { enable = mkEnableOption "sxhkd"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            sxhkd
        ];
        home.file.".config/sxhkd" = {
            source = ./.;
            recursive = true;
        };
        services.sxhkd = {
            enable = true;
            keybindings = {
                "super + Return"	= "kitty -o allow_remote_control=yes";
                "super + shift + {q,e}" = "bspc node -{c,k}";
                "super + alt + {q,r}" 	= "bspc {quit,wm -r}";
                "super + d"             = "rofi -modi drun,run -show drun -show-icons -theme ~/.config/rofi/config.rasi";
                "super + {t,shift + t,s,f}" = "bspc node -t {\~tiled,\~pseudo_tiled,\~floating,\~fullscreen}";
                "super + shift + Escape" = "pkill -USR1 -x sxhkd";
                "super + {1-9,0}" = "bspc desktop -f 'focused:^{1-9,10}'";
                "super + shift + {1-9,0}" = "bspc node -d 'focused:^{1-9,10}' --follow";
                "super + {_,shift + } {F1,F2,F3,Return}" = "bash ~/.config/sxhkd/bspcExtra.sh switchToWorkspace {true,false} {firefox,code,qtfm,kitty} {󰈹,󰨞,,}";
                "super + {h,j,k,l}" = "bash ~/.config/sxhkd/bspcExtra.sh focusToDir {west,south,north,east}";
                "super + shift + {h,j,k,l}" = "bash ~/.config/sxhkd/bspcExtra.sh windowToDir {west,south,north,east}";
                "super + control + {h,j,k,l}" = "bash ~/.config/sxhkd/bspcExtra.sh workspaceToDir {west,south,north,east}";
                "super + v" = "bspc node @parent -R 90";
                "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,left 20 0}";
                "super + alt + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,bottom 0 -20, left 20 0}";
                "super + {_,shift + } Tab" = "bspc desktop -f {next, prev}";
                "XF86MonBrightness{Up,Down}" = "xbacklight {-inc,-dec} 5";
            };
        };
    };
}