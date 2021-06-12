if type op >/dev/null 2>&1; then
	#Add 1password(op) completion to bash. Read 'op help completion' for changing to another shell.
	if [ "$CURRENT_SHELL" = "bash" ]; then
		#Stop shellcheck from complaining that it can't verify the "file"
		# shellcheck source=/dev/null
		. <(op completion bash)
	elif [ "$CURRENT_SHELL" = "zsh" ]; then
		eval "$(op completion zsh)"; compdef _op op
	fi
	#Allow rofi to run 1password
	alias signin='op signin > /home/james/.op/session'
	#Get my personal acces token for github (not a password)
	alias pat="op get item 'cvbr24pd22z6wnpzpwnztywmmu' | jq -r '.details.sections[].fields[] | select(.t==\"Personal Acces Token\").v'"
fi
