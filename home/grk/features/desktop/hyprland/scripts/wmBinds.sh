SwitchToWorkspace() {
  active=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true).specialWorkspace.name | split(":") | if length > 1 then .[1] else "" end')
  if [[ ${#active} -gt 0 ]]; then
      hyprctl dispatch togglespecialworkspace "$active"
  fi
  hyprctl dispatch workspace r~"$1"
}

OpenSpecialWorkspace(){
  ws=$1
  wsJson=$(hyprctl workspaces -j | jq -r --arg ws "special:$ws" '.[] | select(.name == $ws)')
  if [[ "$wsJson" ]]; then
    wsID=$(echo "$wsJson" | jq -r ".id")
    # echo "wsID: $wsID"
    wsCurrMon=$(echo "$wsJson" | jq -r '.monitor')
    monitors=$(hyprctl monitors -j)
    oldMonitor=$(echo "$monitors" | jq -r ".[] | select(.specialWorkspace.id == $wsID).name")
    # echo "oldMonitor: $oldMonitor"
    # echo "$monitors" | jq -r ".[] | select(.specialWorkspace.id == $wsID).name"
    focusedMonitor=$(echo "$monitors" | jq -r '.[] | select(.focused) | .name')

    if [[ "$wsCurrMon" != "$focusedMonitor" ]]; then
      if [[ $oldMonitor ]]; then
        # maybe this needs a loop
        # echo "focusing $oldMonitor and toggling special $ws"
        hyprctl dispatch focusmonitor "$oldMonitor"
        hyprctl dispatch togglespecialworkspace "$ws"
      fi

      # echo "moving special:$ws to $focusedMonitor"
      hyprctl dispatch moveworkspacetomonitor special:"$ws" "$focusedMonitor"

      # echo "focusing $focusedMonitor"
      hyprctl dispatch focusmonitor "$focusedMonitor"
    fi
  fi
  # echo "toggling special $ws"
  hyprctl dispatch togglespecialworkspace "$ws"
}

ChangeMonitorSettings(){
  monitors=$(hyprctl monitors -j)
  monitorName=$(echo "$monitors" | jq -r ".[] | .name" | wofi --show dmenu --prompt "Select monitor" --width 50% --height 50% --cache-file /tmp/wofi-cache)
  # echo "monitorName: $monitorName"
  monitorJSON=$(echo "$monitors" | jq -r ".[] | select(.name == \"$monitorName\")")
  # echo "monitorJSON: $monitorJSON"
  selectedMode=$(echo "$monitorJSON" | jq -r ".availableModes[]" | wofi --show dmenu --prompt "Select mode")
  # echo "selectedMode: $selectedMode"
  position=$(printf "auto\nauto-left\nauto-right\nauto-up\nauto-down" | wofi --show dmenu --prompt "Select mode")
  # echo "position: $position"
  scale=$(echo "auto" | wofi --show dmenu --prompt "Select scale")
  # echo "scale: $scale"
  hyprctl keyword monitor "$monitorName","$selectedMode","$position","$scale"
}

subargs=("${@:2}")
# echo $subargs
case "$1" in
  SwitchToWorkspace)
    SwitchToWorkspace "${subargs[@]}"
    ;;
  OpenSpecialWorkspace)
    OpenSpecialWorkspace "${subargs[@]}"
    ;;
  ChangeMonitorSettings)
    ChangeMonitorSettings "${subargs[@]}"
    ;;

  *)
    echo "Usage: $0 {SwitchToWorkspace|OpenSpecialWorkspace|ChangeMonitorSettings} [args]"
    ;;
esac