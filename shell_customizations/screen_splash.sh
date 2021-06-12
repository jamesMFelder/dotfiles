#!/bin/bash
#Both of these should only be run from the console.
#I assume it is fine to run from tmux but I haven't tested.
#Just a fun little trick I got from the internet
[ "$TERM" = "linux" ] && alias screen_splash='clear && { cat /dev/urandom > /dev/fb0; sleep 10; cat /dev/zero > /dev/fb0; } 2>/dev/null '
#Run a sequence of commands that ends with starting X if the required other file exists
[ "$TERM" = "linux" ] && [ -f /home/james/dotfiles/shell_customizations/systemd.sh ] && alias gui='find_hang -d; sleep 10; screen_splash; startx'
