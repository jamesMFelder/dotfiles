#List systemd services in the critical chain that are taking a while
function find_hang(){
	#If no arguments, just do a simple one in the terminal
	#Also usefull for getting it if doing a more fancy one
	if [[ "$#" -eq 0 ]]; then
    	systemd-analyze critical-chain 2>&1 | grep "$(systemd-analyze blame |& awk '{print $2}')" | sed 's/^ *//g' | grep '[[:digit:]]s$' | sort -k3n | tac
	#If more than one argument: crash.
	elif [[ "$#" -gt 1 ]]; then
		echo -e "$FUNCNAME: error, unexpected number of arguments.\nExpected 0 or 1 arguments. Try $FUNCNAME -h" >&2
		return 2
	#Otherwise: find what argument is being asked of us
	else
		case $1 in
			"-h" | "--help" | "-?")    echo -e "$FUNCNAME [OPTIONS]:\nWhere options are:\n\t-? -h --help: Show this message.\n\t-d --dialog: Show it using the dialog command." >&2 ;;
			#Use the dialog command
			"-d" | "--dialog")         lines=$( { $FUNCNAME; echo; echo; } | wc -l); length=$( $FUNCNAME | wc -L); dialog --infobox "$(${FUNCNAME})" ${lines} $(bc <<< ${length}+5) ;;
			"*")                       echo -e "$FUNCNAME: error, unknown argument $1\nTry $FUNCNAME --help to see supported options"; return 2;;
		esac
	fi
}
