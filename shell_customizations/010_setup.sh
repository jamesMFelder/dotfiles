#So I can tell bash from dash from zsh
CURRENT_SHELL=$(awk -F/ '{gsub("-","");gsub("\0","");print $NF}' < /proc/$$/cmdline)

#If I ran it as sh, find out what is really running
if [ "$CURRENT_SHELL" = "sh" ]; then
	#Use which in case it is something like /usr/local/bin/sh
	CURRENT_SHELL=$(readlink $(which sh))
fi

#Export it.
export CURRENT_SHELL
