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

#Don't open several files (n)vim can't handle (https://stackoverflow.com/questions/13280263/ignore-file-extension-in-bash-completion-for-vim)
function _vi() {
  local cur prev idx ext

  COMPREPLY=()
  _get_comp_words_by_ref cur prev

  case $prev in
    -h|--help|-v|--version)
      return 0
      ;;
  esac

  if [[ "$cur" == -* ]] ; then
    local _vopts='-v -e -E -s -d -y -R -Z -m -M -b -l -C'
    _vopts="${_vopts} -N -V -D -n -r -r -L -A -H -F -T -u"
    _vopts="${_vopts} --noplugin -p -o -O --cmd -c -S -s -w -W"
    _vopts="${_vopts} -x -X --remote --remote-silent --remote-wait"
    _vopts="${_vopts} --remote-wait-silent --remote-tab --remote-send"
    _vopts="${_vopts} --remote-expr --serverlist --servername"
    _vopts="${_vopts} --startuptime -i -h --help --version"
    mapfile -u <(compgen -W "${_vopts}" -- "$cur") COMPREPLY
    #COMPREPLY=( $( compgen -W "${_vopts}" \
    #  -- "$cur" ) )
    return 0
  fi

  local _VIM_IGNORE=(pdf xdvi jpg pyc exe tar zip ps o d kernel)
  _filedir
  for idx in "${!COMPREPLY[@]}"; do
    ext=${COMPREPLY[$idx]}
    ext=${ext##*.}
    for iext in "${_VIM_IGNORE[@]}"; do
      if test "$ext" = "$iext"; then
        unset -v "COMPREPLY[$idx]"
        break
      fi
    done
  done
  return 0
}

complete -F _vi vi vim nvim
