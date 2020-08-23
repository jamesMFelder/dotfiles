#List systemd services in the critical chain that are taking a while
function find_hang(){
	#If no arguments, just do a simple one in the terminal
	if [[ "$#" -eq 0 ]]; then
    	systemd-analyze critical-chain |& grep "$(systemd-analyze blame |& awk '{print $2}')" | sort -k 3n | tac
	#If more than one argument: crash.
	elif [[ "$#" -gt 1 ]]; then
		echo -e "find_hang: error, unexpected number of arguments.\nExpected 0 or 1 arguments. Try $funcname -h" >&2
		return 2
	#Otherwise: find what argument is being asked of us
	else
		case $1 in
			"-h" | "--help" | "-?")    echo -e "find_hang [OPTIONS]:\nWhere options are:\n\t-? -h --help: Show this message.\n\t-d --dialog: Show it using the dialog command." >&2 ;;
			"-d" | "--dialog")         dialog --infobox "$(find_hang)" $( { find_hang; echo; echo; } | wc -lL) ;;
			"*")                       echo -e "find_hang: error, unknown argument $1\nTry find_hang --help to see supported options"; return 2;;
		esac
	fi
}
