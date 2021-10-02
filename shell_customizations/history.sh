#Don't put basic commands in history
#Needs to match the full line (no implicit .* at the end)
#      `ls dir/` is remembered, but `ls` isn't
export HISTIGNORE="$HISTIGNORE:ls:clear:cls:exit:\:q"
