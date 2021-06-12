#List all info about disk space for attached devices
#Breaks pattern by putting mountpoint first
which lsblk >/dev/null 2>&1 && alias disk_space='lsblk -o name,mountpoint,size,fsavail,fsused,fsuse%'
