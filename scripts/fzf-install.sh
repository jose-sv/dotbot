#!/bin/bash

if ! fzf_loc="$(type -p fzf)" || [[ -z $fzf_loc ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
