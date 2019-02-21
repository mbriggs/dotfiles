export LIBRARIES_HOME="$HOME/libraries"

function copy-inst {
  cp -v $HOME/code/vinny/instructions/$1.yml $HOME/code/notion/backend/apps/vinny/instructions/$1.yml
}

function copy-desc {
  cp -v $HOME/code/vinny/instructions/descriptors/$1.yml $HOME/code/notion/backend/apps/vinny/instructions/descriptors/$1.yml
}
