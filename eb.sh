#! /bin/bash
sleep 2
a=$(xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) WM_NAME | sed -e 's/.*"\(.*\)".*/\1/')
xprop -name "$a" -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0
set -u
clear
