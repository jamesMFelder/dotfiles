#!/bin/bash
#Just a fun little trick I got from the internet
alias screen_splash='clear && { cat /dev/urandom > /dev/fb0; sleep 10; cat /dev/zero > /dev/fb0; } 2>/dev/null '
#Run a sequence of commands that ends with starting i3 if the required other file exists
[ -f /home/james/dotfiles/shell_customizations/systemd.sh ] && alias gui='find_hang -d; sleep 10; screen_splash; startx'
