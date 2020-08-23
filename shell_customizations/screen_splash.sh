#!/bin/bash
alias screen_splash='clear && { cat /dev/urandom > /dev/fb0; sleep 10; cat /dev/zero > /dev/fb0; } 2>/dev/null '
