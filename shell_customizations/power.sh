function bat_level () {
	charge_now=$(</sys/class/power_supply/BAT0/charge_now)
	charge_full=$(</sys/class/power_supply/BAT0/charge_full)
	bc -q <<- EOF | sed 's/$/%/'
	scale=2
	${charge_now} / ${charge_full} * 100
	EOF
}
