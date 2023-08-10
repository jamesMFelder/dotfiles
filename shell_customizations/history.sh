#Don't put basic commands in history
#Needs to match the full line (no implicit .* at the end)
#      `ls dir/` is remembered, but `ls` isn't
export HISTIGNORE="$HISTIGNORE:ls:clear:cls:exit:\:q"

#Don't save lines starting with a space or
#that are the same as the one above them
export HISTCONTROL="ignoreboth"
