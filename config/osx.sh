#!/usr/bin/env bash

if  [ `uname` == "Darwin" ]
then
  export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
  if [ -f /usr/local/bin/gls ]
  then
    alias ls='gls --color'
    alias dircolors=gdircolors
  else
    alias ls='ls -G'
  fi

  export PATH=/usr/local/bin:$PATH
fi
