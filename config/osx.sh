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

  gnu=(coreutils findutils gnu-indent gnu-sed gnutls grep gnu-tar gawk)

  for package in "${gnu[@]}"
  do
    export PATH=/usr/local/opt/$package/libexec/gnubin:$PATH
  done

  export PATH=/usr/local/bin:$PATH
fi
