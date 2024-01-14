# From https://www.linuxfromscratch.org/blfs/view/stable/postlfs/profile.html
# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export "$PATHVARIABLE"="$NEWPATH"
}

pathprepend () {
	#shellcheck disable=2086 # pathremove checks if $PATHVARIABLE ($2) is non-existent, not non-empty
        pathremove "$1" $2
        local PATHVARIABLE=${2:-PATH}
        export "$PATHVARIABLE"="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
	#shellcheck disable=2086 # pathremove checks if $PATHVARIABLE ($2) is non-existent, not non-empty
        pathremove "$1" $2
        local PATHVARIABLE=${2:-PATH}
        export "$PATHVARIABLE"="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

# Get rid of duplicate path entries
# If this gives you a shellcheck warning and you are using a version < v0.6.0,
#   add shellcheck disable=2119 to the call site
#shellcheck disable=2120 # We can use a default argument here
pathclean () {
	local PATHVARIABLE=${1:-PATH}
	local OLDPATHVAR="${!PATHVARIABLE}"
	local OLDPATH="$OLDPATHVAR"
	export "$PATHVARIABLE"=""
	local IFS=:
	for dir in $OLDPATH; do
		pathappend "$dir" "$PATHVARIABLE"
	done
}

[ "$CURRENT_SHELL" = "bash" ] && func_export="-f" || func_export=
# shellcheck disable=2086 # If func_export is empty, don't create an argument for it
export ${func_export?} pathremove pathprepend pathappend pathclean

pathprepend /home/james/bin
pathprepend /home/james/.local/bin
pathprepend /home/james/.cargo/bin
[ -d /usr/lib/llvm-15/bin ] && pathappend /usr/lib/llvm-15/bin
pathclean
