# Load configs from ~/shell_customizations
if [[ -d ~/dotfiles/shell_customizations ]]; then
	for file in $HOME/dotfiles/shell_customizations/*; do
		test -r "$file" && . "$file"
	done
	unset file
fi
