
#!/bin/bash
# handy external script paste — GNOME wayland
# wtype doesn't work on GNOME (no zwp_virtual_keyboard_v1)
# ydotool uses /dev/uinput, works everywhere
#
# CRITICAL: wl-copy forks a daemon that inherits our fds.
# handy's paste_via_external_script uses .output() which blocks
# until all stdout/stderr writers close. without redirection,
# wl-copy's daemon keeps fds open → handy blocks forever → zombie.

# copy text to wayland clipboard (detach wl-copy's daemon from our fds)
wl-copy -- "$1" </dev/null >/dev/null 2>&1

# simulate Ctrl+Shift+V (terminal paste) via ydotool
# keycodes: ctrl=29, shift=42, v=47
ydotool key 29:1 42:1 47:1 47:0 42:0 29:0
