 #!/usr/bin/env bash

res=$(rofi -dmenu -lines 6 -columns 3 -u 2-5 -font "xos4 Terminus 14" -p "What do you want to do? " -input < ~/.i3/rofi-i3exit.opts)

if [[ $res = "LOCK SCREEN" ]]; then
    xset dpms force off
fi
if [[ $res = "LOGOUT TO TTY" ]]; then
    pkill -f xss-lock && pkill -f bash && rm -f /tmp/screen_lock_toggled_off.lock /tmp/openconnect_vpn.lock && i3-msg exit
fi
if [[ $res = "HIBERNATE TO DISK" ]]; then
    systemctl hibernate
fi
if [[ $res = "REBOOT" ]]; then
    systemctl reboot
fi
if [[ $res = "SHUTDOWN" ]]; then
    systemctl poweroff
fi
exit 0
