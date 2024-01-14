#Run this command as root for wifi
which iftop >/dev/null 2>&1 && alias iftop='sudo iftop -i wlp2s0'
#Colorize output
which ip >/dev/null 2>&1 && alias ip='ip --color=auto'
