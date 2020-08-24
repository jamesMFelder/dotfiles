#!/bin/bash
#Just a fun little trick I got from the internet
alias screen_splash='clear && { cat /dev/urandom > /dev/fb0; sleep 10; cat /dev/zero > /dev/fb0; } 2>/dev/null '
#Run a sequence of commands that ends with starting i3 if the required other file exists
[[ -f systemd.sh ]] && alias gui='dialog_find_hang; sleep 10; screen_splash; startx'
