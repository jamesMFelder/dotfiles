which vim >/dev/null 2>&1 && alias vi='vim'
#Open readonly
which vim >/dev/null 2>&1 && alias view='vim -R'
#Others should change this
if which vim >/dev/null 2>&1; then
export EDITOR=vim
else
export EDITOR=vi
fi
#This is a symptom of how much I use vi (if only Google Docs supported vi editing commands)
alias :q='exit'
