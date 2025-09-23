#!/bin/bash

# Get a list of all sinks (using pw-cli)
# pw-cli can list sinks, but the output is not as clean as pactl for this purpose,
# so we use a different approach with pactl.
SINKS=$(pactl list short sinks | awk '{print $2}')

# Get the name of the current default sink
CURRENT_SINK=$(pactl info | grep 'Default Sink' | cut -d':' -f2 | tr -d ' ')

# Find the next sink in the list.
NEXT_SINK=""
found_current=0

for sink in $SINKS; do
    if [ "$found_current" -eq 1 ]; then
        NEXT_SINK="$sink"
        break
    fi
    if [ "$sink" == "$CURRENT_SINK" ]; then
        found_current=1
    fi
done

# If we were on the last sink, loop back to the first.
if [ -z "$NEXT_SINK" ]; then
    NEXT_SINK=$(echo "$SINKS" | head -n 1)
fi

# Set the new default sink.
# PipeWire's session manager (WirePlumber by default) will automatically
# move all currently playing streams to the new default sink. This is a
# key difference from PulseAudio.
pactl set-default-sink "$NEXT_SINK"

# (Optional) Notify the user of the change.
notify-send "Switched Audio Output" "New sink: $NEXT_SINK"

