#!/usr/bin/env bash

doom() {
  pushd "$HOME/.emacs.d"
  ./bin/doom $1
  popd
}

alias em=emacs

mb-calculate-dpi() {
  xdpyinfo | grep dots | sed -E 's/.*resolution:[[:blank:]]+([0-9]+).*/\1/' > $HOME/.mb-dpi
}
