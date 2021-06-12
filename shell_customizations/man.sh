#Colorize man output using bat(cat)
if which bat >/dev/null 2>&1; then
export MANPAGER="sh -c 'col -bx | bat -lman -p'"
elif which batcat >/dev/null 2>&1; then
export MANPAGER="sh -c 'col -bx | batcat -lman -p'"
else
export MANPAGER="less -R --use-color -Dd+r -Du+b"
fi
