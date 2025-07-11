#!/bin/bash

# AeroSpace workspace plugin for SketchyBar

WORKSPACE_ID=$1

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$WORKSPACE_ID background.color=0xff7aa2f7 \
                                        icon.color=0xff1a1b26
else
    sketchybar --set space.$WORKSPACE_ID background.color=0x44ffffff \
                                        icon.color=0xffffffff
fi
