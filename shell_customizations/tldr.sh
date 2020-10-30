#Add tldr autocomplete if running bash
if [ "$CURRENT_SHELL" = "bash" ]; then
	#The location of the tldr cache
	cachedir=~/.local/share/tldr # Or whatever else the location of the tldr cache is
	#Autocomplete from it, taking out the .md extension
	complete -W "$(q=($cachedir/*/*/*); sed 's@\.md @ @g' <<<${q[@]##*/})" tldr
fi
