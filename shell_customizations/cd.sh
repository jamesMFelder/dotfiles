#autocd if in bash
[ "$CURRENT_SHELL" = "bash" ] && shopt -s autocd
#Assume I will oftem want to jump right into a src directory
if test "${PS1+set}"; then CDPATH=".:/home/james/src/"; fi
#Create a directory and enter into it
function mkcd(){
	#shellcheck disable=2164 #We don't do anything after the `cd` so we don't handle an error from it.
	mkdir "$1" && cd "$1"
}
