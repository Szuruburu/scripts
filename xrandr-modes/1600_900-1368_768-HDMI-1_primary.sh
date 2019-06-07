#!/bin/sh
xrandr --newmode "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
xrandr --addmode HDMI-1 1600x900_60.00
xrandr --output HDMI-1 --primary --mode 1368x768 --pos 1600x132 --rotate normal --output HDMI-1 --mode 1600x900_60.00 --pos 0x0 --rotate normal
