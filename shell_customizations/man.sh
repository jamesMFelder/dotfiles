#Use vim as the pager for man
#The set ft=man provides syntax highlighting and such
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' - \""
