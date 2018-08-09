#!/usr/bin/bash


alias glf="git log --pretty=full"
alias gld='git log --graph --decorate --oneline'
alias gc='git commit -v'
alias gd="git diff"
alias gap='git add -N . && git add -p'
alias gdc="git diff --cached"
alias gca="read msg; git commit -am \"$msg\""
alias ga="git add -A ."
alias g="git"
alias gs="git status"
alias less="less -R"

alias copy-settings="for example in settings/*.example; do cp -v \$example settings/\$(basename \$example .example); done"
