#because I always want this
alias ls='ls --color=auto'
#Mark each type of file
alias l='ls -CF'
#long format
alias ll='ls -l'
#show all
alias la='ls -A'
#show everything long format
alias lla='ls -l -a'
#show a directory in long format
alias lld='ls -ld'
#show a nonexistent target of a symlink with a red background
export LS_COLORS="$LS_COLORS:mi=30;41;02"
#just to get a laugh when I mistype (requires the sl package)
which sl >/dev/null 2>&1 && alias sl='sl -alFe'
