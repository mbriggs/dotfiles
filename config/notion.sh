function nt {
  cd ~/notion/$1
}

_nt () {
    IFS=$'\n' tmp=( $(compgen -W "$(ls --color=never ~/notion)" -- "${COMP_WORDS[$COMP_CWORD]}" ))
    COMPREPLY=( "${tmp[@]}" )
}
complete -o filenames -F _nt nt
