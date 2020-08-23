alias grep='grep --color=auto'
alias gh='history | grep'
function cros (){
grep -i $1 /usr/share/dict/cracklib-small | column
}
function ros (){
grep -i $1 /usr/share/dict/cracklib-small
}
