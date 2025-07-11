#!/bin/bash

# Front app plugin for SketchyBar

if [ "$SENDER" = "front_app_switched" ]; then
    sketchybar --set $NAME label="$INFO"
fi
