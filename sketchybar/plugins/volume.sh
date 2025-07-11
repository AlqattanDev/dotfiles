#!/bin/bash

# Volume plugin for SketchyBar

VOLUME=$(osascript -e "output volume of (get volume settings)")

ICON="󰕿"
if [[ $VOLUME -eq 0 ]]; then
    ICON="󰖁"
elif [[ $VOLUME -lt 50 ]]; then
    ICON="󰖀"
fi

sketchybar --set $NAME icon="$ICON" label="${VOLUME}%"
