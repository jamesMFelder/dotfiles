#Create a directory and enter into it
function mkcd(){
	#shellcheck disable=2164 #We don't do anything after the `cd` so we don't handle an error from it.
	mkdir -p "$1" && cd "$1"
}

#Remove the current directory if empty (leave it first)
function rmcurdir(){
	local curdir="${PWD}"
	cd ..
	rmdir "${curdir}"
}
