{ ... }:

let 
  workspaceBindsGenerator = i:
    let ws = i + 1;
    in [
      "$mod, code:1${toString i}, execr, wmBinds SwitchToWorkspace ${toString ws}"
      "$mod SHIFT, code:1${toString i}, movetoworkspace, r~${toString ws}"
    ];
  specialWorkspaceGenerator = i:
    let ws = i + 1;
    in if (ws < 2 || ws > 4) then [
      "$mod, F${toString ws}, execr, wmBinds OpenSpecialWorkspace F${toString ws}"
    ] else [];
in
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind =
    [
      "$mod, mouse:272, movewindow"
      "$mod, q, exec, kitty"
      "$mod, RETURN, exec, kitty"

      "$mod, d, exec, wofi  --show drun -I -m -G"

      "$mod SHIFT, q, killactive"
      "$mod SHIFT, e, forcekillactive"

      "$mod, F2, exec, code"
      "$mod, F3, exec, qtfm"
      "$mod, F4, exec, kitty"

      "$mod, Escape, execr, wmBinds OpenSpecialWorkspace MainTerminal"
      "$mod, Pause, exec, wmBinds LaunchScriptInKittyWS"

      "$mod, m, exit"
      "ALT, l, exec, hyprlock"
      # "$mod, v, exec, copyq toggle"
      "$mod, v, exec, cliphist-wofi-img | wl-copy"

      "$mod, Left, movefocus, l"
      "$mod, Down, movefocus, d"
      "$mod, Up, movefocus, u"
      "$mod, Right, movefocus, r"
      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"
      "$mod SHIFT, Left, movewindow, l"
      "$mod SHIFT, Down, movewindow, d"
      "$mod SHIFT, Up, movewindow, u"
      "$mod SHIFT, Right, movewindow, r"
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, j, movewindow, d"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, l, movewindow, r"

      "$mod, r, layoutmsg, togglesplit"

      "ALT, f, togglefloating"
      "$mod, f, fullscreen, 0"
      "$mod SHIFT, f, fullscreen, 1"
      '', Print, exec, grim -g "$(slurp -d)" - | wl-copy''
      "$mod, p, execr, wmBinds ChangeMonitorSettings"

      "$mod, Home, exec, wmBinds ManageVPNs"

      "$mod, Space, exec, wmBinds CycleKeyboardLayout"
    ] 
    ++ builtins.concatLists (builtins.genList workspaceBindsGenerator 9)
    ++ builtins.concatLists (builtins.genList specialWorkspaceGenerator 12)
    ;
  };
}