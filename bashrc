# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups:ignorespace
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# multiline commands save as one
shopt -s cmdhist

# ssh completion
[ -e "$HOME/.ssh/config" ] && complete \
  -W "$(sed -E -n 's/^Host[ \t]+(.*)[ \t]*$/\1/p' ~/.ssh/config | uniq | xargs echo)" \
  ssh

# bash completion
[ -f /etc/bash_completion ] && source /etc/bash_completion


# chruby
[ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh

function _chruby() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local rubies="system ${RUBIES[@]##*/}"

    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=($( compgen -W "$rubies" -- $cur ))
    fi
}
complete -F _chruby chruby

# ssh agent
[ -f $HOME/.ssh/id_rsa ] && ssh-add $HOME/.ssh/id_rsa &> /dev/null

$HOME/dotfiles/bin/inspiration --header

# Ruby configuration
export GEM_PATH=./gems
export TEST_BENCH_EXCLUDE_PATTERN="_init.rb$"

export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export PATH=$PATH:$HOME/dotfiles/bin
export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

export BLACK="\[\e[0;30m\]" # reverse video
export CYAN="\[\e[0;32m\]"
export YELLOW="\[\e[0;33m\]"
export MAGENTA="\[\e[0;35m\]"
export GREEN="\[\e[0;36m\]"
export GRAY="\[\e[0;37m\]"
export RESET="\[\e[0m\]"

for file in $HOME/dotfiles/config/*.sh
do
  source $file
done

source "$ICLOUD/Dev/secrets.sh"

eval `dircolors $HOME/.dircolors`
