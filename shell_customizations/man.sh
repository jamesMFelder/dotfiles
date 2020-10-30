#Colorize man output
man () {
    LESS_TERMCAP_md=$(printf '\e[01;31m') \
    LESS_TERMCAP_me=$(printf '\e[0m') \
    LESS_TERMCAP_us=$(printf '\e[01;32m') \
    LESS_TERMCAP_ue=$(printf '\e[0m') \
    LESS_TERMCAP_so=$(printf '\e[45;93m') \
    LESS_TERMCAP_se=$(printf '\e[0m') \

    export LESS_TERMCAP_md LESS_TERMCAP_me LESS_TERMCAP_us LESS_TERMCAP_ue LESS_TERMCAP_so LESS_TERMCAP_se

    command man "$@"
}
