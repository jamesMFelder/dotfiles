#Get raspberry pi version
alias rpi_rev='rev=$(awk "/^Revision/ { print \$3 }" /proc/cpuinfo ) && curl -L perturb.org/rpi?rev=$rev'
