#So I can tell bash from dash from zsh
CURRENT_SHELL=$(awk -F/ '{gsub("-","");gsub("\0","");print $NF}' < /proc/$$/cmdline)

#If I ran it as sh, find out what is really running
#Use "$CURRENT_SHELL"x to disable a warning about a null byte
if [ "$CURRENT_SHELL" = "sh" ]; then
	CURRENT_SHELL=$(readlink /bin/sh)
fi

#Export it.
export CURRENT_SHELL
