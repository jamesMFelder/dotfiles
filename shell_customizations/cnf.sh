#Search package repos if command is not found
#Tell shellcheck to not check this file
# shellcheck source=/dev/null
[ "$CURRENT_SHELL" != "dash" ] && [ -f /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found."$CURRENT_SHELL"
