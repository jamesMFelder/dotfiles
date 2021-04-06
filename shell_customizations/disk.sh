#List all info about disk space for attached devices
#Breaks pattern by putting mountpoint first
alias disk_space='lsblk -o name,mountpoint,size,fsavail,fsused,fsuse%'
