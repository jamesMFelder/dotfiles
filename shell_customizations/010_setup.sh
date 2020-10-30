#So I can tell bash from dash from zsh
CURRENT_SHELL=$(awk -F/ '{gsub("-",""); print $NF}' < /proc/$$/cmdline)

#If I ran it as sh, find out what is really running
if [ "$CURRENT_SHELL" = "sh" ]; then
	CURRENT_SHELL=$(readlink /bin/sh)
fi

#Export it.
export CURRENT_SHELL
