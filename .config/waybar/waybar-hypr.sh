#!/usr/bin/env sh

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# Launch main
waybar -c ~/.config/waybar/config-hypr.jsonc -s ~/.config/waybar/style-hypr.css &> /dev/null & disown
