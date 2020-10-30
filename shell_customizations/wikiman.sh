if [ -d /usr/share/wikiman/ ]; then
	# shellcheck source=/dev/null #Tell the shellcheck program not to look for this file when checking
	. /usr/share/wikiman/widgets/widget."${CURRENT_SHELL}"
fi
