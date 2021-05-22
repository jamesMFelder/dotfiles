#Colorize man output using bat
#If it complains about not being able to find bat: use batcat
man () {
	command man "$@" | bat -lman -p
}
