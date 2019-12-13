#!/usr/bin/bash


alias glf="git log --pretty=full"
alias gld='git log --graph --decorate --oneline'
alias gc='git commit -v'
alias gd="git diff"
alias gap='git add -N . && git add -p'
alias gdc="git diff --cached"
alias g="git"
alias gs="git status"
alias less="less -R"
alias vi="nvim"

alias rerun-tests="rerun -xc ruby test/automated.rb -- -a"

alias copy-settings="for example in settings/*.example; do cp -v \$example settings/\$(basename \$example .example); done"

function gpu()
{
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} > /dev/null 2>&1; then
        git push origin HEAD
    else
        git push -u origin HEAD
    fi
}
