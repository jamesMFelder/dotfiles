alias grep='grep --color=auto'
cros (){
grep -i "$1" /usr/share/dict/* | sort -u | column
}
ros (){
grep -i "$1" /usr/share/dict/* | sort -u
}
