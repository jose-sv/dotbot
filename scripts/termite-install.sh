#!/bin/bash

sudo apt-get install -y \
  git \
  g++ \
  libgtk-3-dev \
  gtk-doc-tools \
  gnutls-bin \
  valac \
  intltool \
  libpcre2-dev \
  libglib3.0-cil-dev \
  libgnutls28-dev \
  libgirepository1.0-dev \
  libxml2-utils \
  gperf

if ! termite_loc="$(type -p termite)" || [[ -z $termite_loc ]]; then
  cd $HOME/.dotfiles/repos
  if [ -d "termite" ]; then
    cd termite; git pull; cd ..
  else
    git clone --recursive https://github.com/thestinger/termite.git
  fi

  if [ -d "vte-ng" ]; then
    cd vte-ng; git pull; cd ..
  else
    git clone https://github.com/thestinger/vte-ng.git
  fi

  echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
  cd vte-ng && ./autogen.sh && make && sudo make install
  cd ../termite && make && sudo make install
  sudo ldconfig
  sudo mkdir -p /lib/terminfo/x; sudo ln -s \
    /usr/local/share/terminfo/x/xterm-termite \
    /lib/terminfo/x/xterm-termite

  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60
fi
