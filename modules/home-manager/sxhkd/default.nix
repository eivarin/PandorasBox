{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.sxhkd;

in {
    options.modules.sxhkd = { enable = mkEnableOption "sxhkd"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            sxhkd
        ];
        services.sxhkd = {
            enable = true;
            keybindings = {
                "super + Return"	= "kitty -o allow_remote_control=yes";
                "super + alt + {q,r}" 	= "bspc {quit,wm -r}";
                "super + d"             = "rofi -modi drun,run -show drun -show-icons -theme ~/.config/rofi/config.rasi";
                "super + {t,shift + t,s,f}" = "bspc node -t {\~tiled,\~pseudo_tiled,\~floating,\~fullscreen}";
                "super + shift + Escape" = "pkill -USR1 -x sxhkd";
                "super + {_,shift + } {F1,F2,F3,Return}" = "toggle={true,false}; \
                                                            {app=firefox ; icon=󰈹 ;\
                                                            , app=code ; icon=󰨞 ;\
                                                            , app=qtfm ; icon= ;\
                                                            , app=kitty ; icon= ; \
                                                            } \
                                                            [[ "$toggle" = true ]] || (NNAME=$(rofi -dmenu -p "Name" -theme ~/.config/rofi/config.rasi); bspc monitor -a "$icon-$NNAME" && bspc desktop -f "$icon-$NNAME") ;\
                                                            $app"
            };
        };
    };
}