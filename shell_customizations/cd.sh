#Create a directory and enter into it
function mkcd(){
	#shellcheck disable=2164 #We don't do anything after the `cd` so we don't handle an error from it.
	mkdir "$1" && cd "$1"
}
