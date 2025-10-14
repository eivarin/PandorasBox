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
  monitors=$(hyprctl monitors all -j)
  monitorName=$(echo "$monitors" | jq -r ".[] | .name" | wofi --show dmenu --prompt "Select monitor" --cache-file /tmp/wofi-monitor-cache)
  if [[ -z "$monitorName" ]]; then
    return
  fi
  monitorJSON=$(echo "$monitors" | jq -r ".[] | select(.name == \"$monitorName\")")
  selectedMode=$(echo "$monitorJSON" | jq -r ".availableModes[]" | wofi --show dmenu --prompt "Select resolution for $monitorName" --cache-file /tmp/wofi-"$monitorName"-res-cache)
  if [[ -z "$selectedMode" ]]; then
    return
  fi
  selectedMode=${selectedMode%Hz} # remove Hz if present
  position=$(printf "auto\nauto-left\nauto-right\nauto-up\nauto-down" | wofi --show dmenu --prompt "Select position" --cache-file /tmp/wofi-"$monitorName"-position-cache)
  if [[ -z "$position" ]]; then
    return
  fi
  scale=$(echo "auto" | wofi --show dmenu --prompt "Select scale")
  if [[ -z "$scale" ]]; then
    return
  fi
  monitorValue="$monitorName","$selectedMode","$position","$scale"
  mode=$(printf "mirror\nexpand" | wofi --show dmenu --prompt "Select mode" --cache-file /tmp/wofi-"$monitorName"-mode-cache)
  if [[ -z "$mode" ]]; then
    return
  fi
  if [[ "$mode" == "mirror" ]]; then
    mirror_monitor=$(echo "$monitors" | jq -r ".[] | .name" | wofi --show dmenu --prompt "Select monitor to mirror" --cache-file /tmp/wofi-mirror-cache)
    if [[ -z "$mirror_monitor" ]]; then
      return
    fi
    monitorValue="$monitorValue",mirror,"$mirror_monitor"
  fi
  hyprctl keyword monitor "$monitorValue"
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

OpenOrFocusKittyWS(){
  monitor=$(hyprctl monitors -j | jq ".[] | select(.specialWorkspace.name == \"special:MainTerminal\").id")
  if [[ -n $monitor ]]; then
    hyprctl dispatch focusmonitor "$monitor"
  else
    hyprctl dispatch togglespecialworkspace MainTerminal
      until [ -S /tmp/MainTerminal ]
      do
        sleep 0.1
        # echo "Waiting for MainTerminal socket..."
      done
  fi
}

KittyLaunchInTab(){
  remoteKitten(){
    kitten @ --to unix:/tmp/MainTerminal "$@"
  }
  tabname=$1
  cmd="${*:2}"
  OpenOrFocusKittyWS
  if [[ -n $(remoteKitten ls | jq ".[].tabs.[] | select(.title == \"$tabname\")") ]]; then
    remoteKitten focus-tab -m "title:$tabname"
  else
    remoteKitten launch --type tab --tab-title "$tabname"
  fi
  until remoteKitten get-text | grep -q "grk@$(hostname)"
  do
      sleep 0.1
      # echo "Waiting for tab $tabname to be ready..."
  done
  remoteKitten send-text -t "title:$tabname" "$cmd\n"
}

LaunchScriptInKittyWS(){
  scripts=$(cat .config/kitty/commonScripts.yml)
  scriptName=$(echo "$scripts" | yq -r '.[] | .name' | wofi --dmenu --prompt "Select script to run")
  scriptObj=$(echo "$scripts" | yq -r ".[] | select(.name == \"$scriptName\")")
  script=$(echo "$scriptObj" | yq -r '.command')
  tab=$(echo "$scriptObj" | yq -r '.tabName')
  KittyLaunchInTab "$tab" "$script"
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

  OpenOrFocusKittyWS)
    OpenOrFocusKittyWS "${subargs[@]}"
    ;;
  KittyLaunchInTab)
    KittyLaunchInTab "${subargs[@]}"
    ;;
  LaunchScriptInKittyWS)
    LaunchScriptInKittyWS "${subargs[@]}"
    ;;

  *)
    echo "Usage: $0 {SwitchToWorkspace|OpenSpecialWorkspace|ChangeMonitorSettings} [args]"
    ;;
esac
