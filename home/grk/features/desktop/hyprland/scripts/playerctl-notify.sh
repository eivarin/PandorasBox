#!/bin/bash

player_name=$(playerctl metadata --format '{{ playerName }}')
metadata_command="playerctl metadata -p $player_name"

icon_url=$($metadata_command --format '{{ mpris:artUrl }}')
icon_path=$icon_url
if [[ (-z "$icon_url" || "$icon_url" == "file://"*) ]]; then
  prefix="file://"
  icon_path=${icon_url#"$prefix"}
fi
if [[ "$icon_url" == "https://"* ]]; then
  mkdir -p /tmp/cover_art
  name=$(basename "$icon_url")
  icon_path=/tmp/cover_art/"$name"
  curl -s "$icon_url" -o "$icon_path"
fi

position_percent=$($metadata_command --format '{{ 100 * position / mpris:length }}')
length=$($metadata_command --format '{{ duration(mpris:length) }}')
position=$($metadata_command --format '{{ duration(position) }}')
title=$($metadata_command --format '{{ title }}')
artist=$($metadata_command --format '{{ artist }}')
album=$($metadata_command --format '{{ album }}')
status=$($metadata_command --format '{{ status }}')

header="${player_name^} - $status"
body_line_1="$title"
body_line_2="$album"
body_line_3="$artist"
body_line_4="$position / $length"


notify-send -h int:value:"$position_percent" "$header" "$body_line_1\n$body_line_2\n$body_line_3\n$body_line_4" -i "$icon_path"