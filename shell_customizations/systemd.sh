#I'm sorry but I just can't
#This also probably fails in zsh
if [ "$CURRENT_SHELL" = "dash" ]; then
	return 0
fi
#List systemd services in the critical chain that are taking a while
find_hang(){
	#If no arguments, just do a simple one in the terminal
	#Also usefull for getting it if doing a more fancy one
	if [ "$#" -eq 0 ]; then
    	systemd-analyze critical-chain 2>&1 | grep "$(systemd-analyze blame 2>&1 | awk '{print $2}')" | sed 's/^ *//g' | grep '[[:digit:]]s$' | sort -k3n | tac
	#If more than one argument: crash.
	elif [ "$#" -gt 1 ]; then
		printf "%s: error, unexpected number of arguments.\nExpected 0 or 1 arguments. Try %s -h" "${FUNCNAME[0]}" "${FUNCNAME[0]}" >&2
		return 2
	#Otherwise: find what argument is being asked of us
	else
		case $1 in
			"-h" | "--help" | "-?")    printf "%s: [OPTIONS]:\nWhere options are:\n\t-? -h --help: Show this message.\n\t-d --dialog: Show it using the dialog command." "${FUNCNAME[0]}" >&2 ;; #Use the dialog command
			"-d" | "--dialog")         lines=$( { "${FUNCNAME[0]}"; echo; echo; } | wc -l); length=$( "${FUNCNAME[0]}" | wc -L); dialog --infobox "$(${FUNCNAME[0]})" "${lines}" "$(printf \"%s+5\" \"${length}\" | bc)" ;;
			"*")                       printf "%s: error, unknown argument $1\nTry ${FUNCNAME[0]} --help to see supported options" "${FUNCNAME[0]}"; return 2;;
		esac
	fi
}
