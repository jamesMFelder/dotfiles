# List what processes are depending on what deleted files

# Prints the command line, and the file
# stdin should be formatted as multiple lines,
# each one containing "/proc/pid/cmdline file"
function print_pid_and_file() {
	while read -r pid file; do
		cmdline=$(tr '\0' ' ' < "$pid")
		printf '"%s" → "%s"\n' "$cmdline" "$file"
	done
}

# Prints all the currently running processes depending on missing files
function needsrestart() {
	#shellcheck disable=2016 # we actually don't want to expand the command within the sed expression until we have the correct arguments for it
	grep -F '(deleted)' /proc/*/maps 2>/dev/null | # Get the processes
		awk '{print $1,$6}' | sed 's/:.* / /' | # Filter the output to only get "/proc/$pid/maps $file"
		grep -v '/memfd\|/SYSV\|/dev/shm\|.cache' | # Ignore false positives (non-files, updated cache files)
		sed 's@/proc/\([[:digit:]]\+\)/maps \(.*\)@/proc/\1/cmdline \2@' | # We care about the /proc/pid/cmdline, not /proc/pid/maps
		print_pid_and_file | # Actually print everything
		uniq # Get rid of lots of duplicates
}
