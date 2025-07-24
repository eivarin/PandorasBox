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

ManageVPNs(){
  vpn=$(nmcli --fields NAME,ACTIVE,TYPE c show | grep wireguard | tr -s ' ' | sed -e 's/yes/(active)/' -e 's/no//' -e 's/wireguard//' | wofi --dmenu | tr -d " ")
  echo "$vpn" | (grep active && nmcli c d "${vpn/(active)/}") || nmcli c u "$vpn"
}

CycleKeyboardLayout(){
  keyboard="$(hyprctl devices -j | jq -r '.keyboards[] | select(.main).name')"
  hyprctl switchxkblayout "$keyboard" next
  value=$(hyprctl devices -j | jq -r ".keyboards[] | select(.main).active_keymap")
  if [[ "$value" == "English (US)" ]]; then
    flag="🇺🇸"
  elif [[ "$value" == "Portuguese" ]]; then
    flag="🇵🇹"
  else
    flag=""
  fi
  notify-send "${flag}Layout changed to ${value}${flag}"
}

SwitchToWindow(){
  address=$1
  button=$2
  if [ "$button" -eq 1 ]; then
      # Left click: focus window. The cursor:no_warps lines are optional.
      hyprctl keyword cursor:no_warps true
      hyprctl dispatch focuswindow address:"$address"
      hyprctl keyword cursor:no_warps false
  # elif [ $button -eq 2 ]; then
  #     # Middle click: maximize window
  #     # TODO: Use the corresponding hyprctl dispatch command. I don't know what would 'maximize' mean in a tiling window manager like hyprland
  elif [ "$button" -eq 3 ]; then
      # Right click: close window
      hyprctl dispatch closewindow address:"$address"
  fi
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
  ManageVPNs)
    ManageVPNs
    ;;
  CycleKeyboardLayout)
    CycleKeyboardLayout
    ;;
  SwitchToWindow)
    SwitchToWindow "${subargs[@]}"
    ;;

  *)
    echo "Usage: $0 {SwitchToWorkspace|OpenSpecialWorkspace|ChangeMonitorSettings} [args]"
    ;;
esac
