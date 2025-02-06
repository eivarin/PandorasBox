# Switch case on the first argument
case "$1" in
  switchToWorkspace)
    # ./bspcExtra.sh switchToWorkspace newWorkspace app icon
    toggle=$2
    app=$3
    icon=$4
    [[ "$toggle" = true ]] || (NNAME=$(rofi -dmenu -p "Name" -theme ~/.config/rofi/config.rasi); bspc monitor -a "$icon-$NNAME" && bspc desktop -f "$icon-$NNAME")
    $app
    ;;
  focusToDir)
    # ./bspcExtra.sh focusToDir direction
    dir=$2
    bspc node -f $dir || bspc monitor -f $dir
    ;;
  windowToDir)
    # ./bspcExtra.sh windowToDir direction
    dir=$2
	  bspc node -s "$dir.local" --follow || bspc node -m "$dir" --follow
    ;;
  workspaceToDir)
    # ./bspcExtra.sh workspaceToDir direction
    dir=$2
    bspc desktop -m "$dir.local" --follow
    ;;
esac