#!/bin/bash

if ! fc-list | grep -Fq Powerline
then
  cd $HOME/.dotfiles/repos
  if [ -d fonts ]; then
    cd fonts; git pull
  else
    git clone https://github.com/powerline/fonts
    cd fonts
  fi
  ./install.sh
fi
