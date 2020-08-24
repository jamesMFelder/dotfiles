if [[ -f /usr/bin/op ]]; then
	#Add 1password(op) completion to bash. Read 'op help completion' for changing to another shell.
	source <(op completion bash)
	#Allow rofi to run 1password
	alias signin='op signin > /home/james/.op/session'
	#Get my personal acces token for github(not a password)
	alias pat="op get item 'Git Hub' | jq -r '.details.sections[].fields[] | select(.t==\"Personal Acces Token\").v'"
fi
