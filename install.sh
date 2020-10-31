#Symlink relevant files into your home directory so you can use this.

#Assume repository "dotfiles" was cloned into "$HOME"
#TODO add a check for where we actually are
PREFIX=$HOME

#error: print $1 to stderr and exit with $2
#if this crashes: we needed to crash anyway!
#TODO add this function to a file in shell_customization
#(don't delete this if you do that! we can't assume it has been sourced)
error (){
	printf "%s\n%s\n" "$1" "Aborting..." >&2
	exit "${2:-1}"
}

#Start with bin: try to symlink it in from a standard location
#Try to have a visable one
if [ ! -d "$HOME/bin" ] || [ ! -f "$HOME/bin/*" ]; then
	CREATE_BIN_LOCATION="$HOME/bin"
#Otherwise, try the other standard but less visable location
elif [ ! -d "$HOME/.local/bin" ] || [ ! -f "$HOME/.local/bin/*" ]; then
	CREATE_BIN_LOCATION="$HOME/.local/bin"
#If both of those fail, just keep it in place (this will also keep updates sane).
else
	CREATE_BIN_LOCATION=""
fi
#Create the link
if [ -n "$CREATE_BIN_LOCATION" ]; then
	if [ -d "$CREATE_BIN_LOCATION" ]; then
		#We have determined it is empty but ask the user anyway
		rm -di "$CREATE_BIN_LOCATION" || error "Cannot remove ${CREATE_BIN_LOCATION}\
		If you don't want to use it create a dummy file in there" 1
	fi
	#We can link in
	ln -s "$HOME/dotfiles/bin" "$CREATE_BIN_LOCATION"
	printf "Linked %s to %s...\n" "$CREATE_BIN_LOCATION" "${PREFIX}/dotfiles/bin"
fi

#Modify $PATH so we can use these commands
#TODO prompt to append to path instead of prepend
echo "PATH=${CREATE_BIN_LOCATION:-${PREFIX}/dotfiles/bin}:\$PATH" >> "${PREFIX}/dotfiles/shell_customizations/path.sh"

#Get the shell customizations
#Bash
[ -f "$HOME/.bash_aliases" ] && mv -i "$HOME/.bash_aliases" "$HOME/.bash_aliases.bak" && printf "Moved %s to %s...\
	Make sure your .bashrc sources $HOME/.bash_aliases\n" "$HOME/.bash_aliases" "$HOME/.bash_aliases.bak"
ln -s "${PREFIX}/dotfiles/.bash_aliases" "$HOME/.bash_aliases"
printf "Linked %s to ...\n" "$HOME/.bash_aliases" "${PREFIX}/dotfiles/.bash_aliases"
#Zsh
[ -f "$HOME/.zshrc" ] && mv -i "$HOME/.zshrc" "$HOME/.zshrc.bak" && printf "Moved %s to %s...\n" "$HOME/.zshrc" "$HOME/.zshrc.bak"
ln -s "${PREFIX}/dotfiles/.zshrc" "$HOME/.zshrc"
printf "Linked %s to %s...\n" "$HOME/.zshrc" "${PREFIX}/dotfiles/.zshrc"
#Dash
[ -f "$HOME/.dashrc" ] && mv -i "$HOME/.dashrc" "$HOME/.dashrc.bak" && printf "Moved %s to %s...\n" "$HOME/.dashrc" "$HOME/.dashrc.bak"
ln -s "${PREFIX}/dotfiles/.dashrc" "$HOME/.dashrc"
printf "Linked %s to %s...\n" "$HOME/.dashrc" "${PREFIX}/dotfiles/.dashrc"
printf "Remember to add '%s' to your $HOME/.profile" "export ENV=$HOME/.dashrc"
#Inputrc
[ -f "$HOME/.inputrc" ] && mv -i "$HOME/.inputrc" "$HOME/.inputrc.bak" && printf "Moved %s to %s...\n" "$HOME/.inputrc" "$HOME/.inputrc.bak"
ln -s "${PREFIX}/dotfiles/.inputrc" "$HOME/.inputrc"
printf "Linked %s to %s...\n" "$HOME/.inputrc" "${PREFIX}/dotfiles/.inputrc"

#Goodby message
printf "All done!\
	Remember to go into %s and run 'git pull' every now and then or create a cron job to do this.\n" "${PREFIX}/dotfiles"
