alias grep='grep --color=auto'
alias gh='history | grep'
cros (){
grep -i "$1" /usr/share/dict/cracklib-small | column
}
ros (){
grep -i "$1" /usr/share/dict/cracklib-small
}
