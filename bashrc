# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups:ignorespace
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

export QT_SCALE_FACTOR=2.5 
export QT_AUTO_SCREEN_SCALE_FACTOR=0.8
# export QT_ENABLE_HIGHDPI_SCALING=0
# export AUTO_SCREEN_SCALE_FACTOR=1
# export QT_SCALE_FACTOR=$RETINA_SCALE_FACTOR

# make sure lang is set for oni
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ONI_NEOVIM_PATH="/usr/local/bin/nvim"

# path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/dotfiles/bin:$HOME/go/bin:$HOME/.gem/ruby/2.7.0/bin

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

# direnv
eval "$(direnv hook bash)"

# rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# rbenv
# [ -f /usr/local/bin/rbenv ] && eval "$(rbenv init -)"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# # chruby
# [ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
# [ -f /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh

# function _chruby() {
#     local cur=${COMP_WORDS[COMP_CWORD]}
#     local rubies="system ${RUBIES[@]##*/}"

#     if [[ $COMP_CWORD -eq 1 ]]; then
#         COMPREPLY=($( compgen -W "$rubies" -- $cur ))
#     fi
# }
# complete -F _chruby chruby

# ssh agent
[ -f $HOME/.ssh/id_rsa ] && ssh-add $HOME/.ssh/id_rsa &>/dev/null

$HOME/dotfiles/bin/inspiration --header

# Ruby configuration
export TEST_BENCH_EXCLUDE_PATTERN="_init.rb$"

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--ansi --exact"

export BLACK="\[\e[0;30m\]" # reverse video
export CYAN="\[\e[0;32m\]"
export YELLOW="\[\e[0;33m\]"
export MAGENTA="\[\e[0;35m\]"
export GREEN="\[\e[0;36m\]"
export GRAY="\[\e[0;37m\]"
export RESET="\[\e[0m\]"

for file in $HOME/dotfiles/config/*.sh; do
  source $file
done

eval $(dircolors $HOME/.dircolors)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
