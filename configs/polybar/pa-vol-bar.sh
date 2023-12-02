#!/bin/bash

bar() {
    if [ "$1" -eq 0 ]; then
        echo -n ''
    else
        echo -n ''
    fi
    filled=$(($1*$2/100))
    rest=$(($2-$filled))
    # echo "$filled $rest"
    [[ $filled -le 0 ]] || printf '%.0s' $(seq 1 $filled) 
    [[ $rest -le 0 ]] || printf '%.0s' $(seq 1 $rest)

    if [ "$1" != 100 ]; then
        printf '\n'
    else
        printf '\n'
    fi
}

# Get the sink index for the default sink
# SINK_INDEX=$(pacmd list-sinks | grep -A 15 '* index' | grep index | awk '{print $3}')

# Monitor events using pactl
pactl subscribe | while read -r event; do
    echo $event | grep "sink" > /dev/null && echo $(bar $(pacmd list-sinks | grep -A 15 '* index' | awk '/volume: front/{ print $5 }' | sed 's/%//') 10)
done