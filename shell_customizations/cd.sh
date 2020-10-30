#autocd if in bash
[ "$CURRENT_SHELL" = "bash" ] && shopt -s autocd
#Assume I will oftem want to jump right into a src directory
if test "${PS1+set}"; then CDPATH=".:/home/james/src/"; fi
