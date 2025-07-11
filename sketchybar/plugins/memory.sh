#!/bin/bash

# Memory usage plugin for SketchyBar

MEMORY_PRESSURE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5}' | sed 's/%//')

if [ -z "$MEMORY_PRESSURE" ]; then
    # Fallback method using vm_stat
    MEMORY_USAGE=$(vm_stat | grep -E "Pages (free|active|inactive|speculative|throttled|wired down|occupied by compressor):" | awk '
    /Pages free:/ { free = $3 }
    /Pages active:/ { active = $3 }
    /Pages inactive:/ { inactive = $3 }
    /Pages speculative:/ { speculative = $3 }
    /Pages throttled:/ { throttled = $3 }
    /Pages wired down:/ { wired = $4 }
    /Pages occupied by compressor:/ { compressed = $5 }
    END {
        total_used = (active + inactive + wired + compressed) * 4096 / 1024 / 1024 / 1024
        printf "%.0f", total_used
    }')
    sketchybar --set $NAME label="${MEMORY_USAGE}GB"
else
    sketchybar --set $NAME label="${MEMORY_PRESSURE}%"
fi
