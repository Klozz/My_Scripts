#!/bin/bash
# Move HDMI device to the left (my secondary monitor is on the left)
# because by default it is on the right
xrandr --output HDMI-0 --left-of DP-0 --auto
