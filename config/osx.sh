#!/usr/bin/env bash

if  [ `uname` == "Darwin" ]
then
  if [ -f /usr/local/bin/gls ]
  then
    alias ls='gls --color'
    alias dircolors=gdircolors
  else
    alias ls='ls -G'
  fi

  export PATH=/usr/local/bin:$PATH
fi
