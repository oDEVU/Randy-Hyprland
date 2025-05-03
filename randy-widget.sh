#!/bin/bash

# Set the path to the Randy binary
RANDY_PATH="$HOME/randy/target/debug/randy"
RANDY_PIDFILE="/tmp/randy_widget.pid"
RANDY_CLASS="randy"
TARGET_WS=1 # Workspace in which randy widget will be displayed.

# Prevent multiple instances of this script
LOCKFILE="/tmp/randy_widget.lock"
if [ -f "$LOCKFILE" ]; then
    echo "Already running"
    exit 1
fi
touch "$LOCKFILE"

# Function to count non-Randy windows on workspace
count_real_windows() {
    hyprctl clients -j | jq "[.[] | select(.workspace.id == $TARGET_WS and .class != \"$RANDY_CLASS\")] | length"
}

# Run loop
while true; do
    count=$(count_real_windows)

    if [ "$count" -eq 0 ]; then
        # No windows on workspace: launch Randy if not running
        if [ ! -f "$RANDY_PIDFILE" ] || ! kill -0 "$(cat "$RANDY_PIDFILE" 2>/dev/null)" 2>/dev/null; then
            "$RANDY_PATH" &
            echo $! > "$RANDY_PIDFILE"
        fi
    else
        # Other windows present: kill Randy if running
        if [ -f "$RANDY_PIDFILE" ]; then
            kill "$(cat "$RANDY_PIDFILE")" && rm "$RANDY_PIDFILE"
        fi
    fi

    sleep 1
done
