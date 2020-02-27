#!/usr/bin/env bash

doom() {
  pushd "$HOME/.emacs.d"
  ./bin/doom $1
  popd
}

alias em=emacs
