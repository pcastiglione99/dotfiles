#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx "$XDG_CONFIG_HOME/X11/xinitrc" > /dev/null 2>&1 &
#  #exec Hyprland
#  #exec sway --unsupported-gpu > /dev/null 2>&1
#fi

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway --unsupported-gpu > /dev/null 2>&1
fi
