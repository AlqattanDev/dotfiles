#!/bin/bash

# Battery plugin for SketchyBar

BATTERY_INFO=$(pmset -g batt)
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATTERY_INFO" | grep 'AC Power')

if [[ $PERCENTAGE = "" ]]; then
    exit 0
fi

ICON="󰂎"
COLOR=0xff9ece6a

if [[ $CHARGING != "" ]]; then
    ICON="󰂄"
    COLOR=0xff7aa2f7
elif [[ $PERCENTAGE -lt 20 ]]; then
    ICON="󰂃"
    COLOR=0xfff7768e
elif [[ $PERCENTAGE -lt 50 ]]; then
    ICON="󰁾"
    COLOR=0xffe0af68
fi

sketchybar --set $NAME icon="$ICON" \
                    icon.color=$COLOR \
                    label="${PERCENTAGE}%"
