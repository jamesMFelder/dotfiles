if [ -n "`grep 'Arch Linux' /etc/os-release`" ]; then
#List all files in the repos, select one with fzf, and print it to stdout
#Show a pane on the right with details (pacman -Si) and a list of files (pacman -Fl)
function pacfind () {
	pacman -Sl | awk '{print $2($4=="" ? "" : " *")}' |\
		fzf ${1:+-q $1} --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1})' |\
		cut -d " " -f 1;
}
#Same but include AUR
function yayfind () {
	yay -Sl | awk '{print $2($4=="" ? "" : " *")}' |\
		fzf ${1:+-q $1} --multi --preview 'cat <(yay -Si {1}) <(yay -Fl {1})' |\
		cut -d " " -f 1
}
fi
