#!/bin/bash

### install packages ###
sudo apt install -y \
  cmake \
  cmus \
  ctags \
  curl \
  feh \
  fonts-font-awesome \
  ghc \
  git \
  haskell-stack \
  htop \
  jq \
  neovim \
  python-pip python-setuptools \
  ranger \
  software-properties-common \
  tmux \
  zsh

stack install ghc-mod \
  hlint \
  hdevtools \
  hindent \
  stylish-haskell

### Install ripgrep ###
if ! rg_loc="$(type -p rg)" || [[ -z $rg_loc ]]; then
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
  sudo dpkg -i ripgrep_0.8.1_amd64.deb
  rm -f ripgrep_0.8.1_amd64.deb
fi
