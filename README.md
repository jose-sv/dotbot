General
-------
My dotfiles, bootstrapped and automated with [dotbot](https://github.com/anishathalye/dotbot). This repo is currently only setup for debian-based environments, and most of the installation scripting will fail on other machines. I plan on making it compatible for Arch eventually.

Installation
------------

To install, run the following:
```console
git clone https://gitlab.com/pksol/dotfiles ~/.dotfiles
cd .dotfiles
./install
```
**Note:** You will need to restart your terminal for fzf to register as installed after the scripts run.
I don't currently have it setup to work for storing the repo wherever you want, but that is on the TODO list.

What's Included?
----------------
### Applications
- cmus
- feh: for setting background in i3
- [fzf](https://github.com/junegunn/fzf)
- htop
- [i3-gaps](https://github.com/Airblader/i3): Fork of i3 window manager with gaps support
- [neovim](https://github.com/neovim/neovim): vim but better, "new" vim
- pip
- ranger: cli file manager
- tmux
- [termite](https://github.com/thestinger/termite)
- zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), powered by [zgen](https://github.com/tarjoilija/zgen)

### Vim Plugins
I use neovim, not vim. However, I alias vim to nvim in my zshrc so you can still just type 'vim' to edit files.
The following plugins are included:
- [ALE](https://github.com/w0rp/ale)
- [Auto-Pairs](https://github.com/jiangmiao/auto-pairs)
- [deoplete](https://github.com/Shougo/deoplete.nvim) and if you're not using neovim the plugins to make vim compatible
- [fzf](https://github.com/junegunn/fzf.vim)
- [gv](https://github.com/junegunn/gv.vim)
- [incsearch](https://github.com/haya14busa/incsearch.vim)
- [indentpython](https://github.com/vim-scripts/indentpython.vim)
- [lightline](https://github.com/itchyny/lightline.vim) with the [lightline-ale](https://github.com/maximbaz/lightline-ale) extension and the lightline [gruvbox theme](https://github.com/shinchu/lightline-gruvbox.vim)
- [tcomment](https://github.com/tomtom/tcomment_vim)
- [unite](https://github.com/Shougo/unite.vim)
- [vim-colorschemes](https://github.com/flazz/vim-colorschemes): pack of colorschemes with all of the ones that I use/like
- [Easymotion](https://github.com/easymotion/vim-easymotion)
- [vimfiler](https://github.com/Shougo/vimfiler.vim)
- [vim-fugitive](https://github.com/tpope/vim-fugitive): Git wrapper for vim
- [gitgutter](https://github.com/airblade/vim-gitgutter): Show gitdiff symbols in vim gutter
- [gutentags](https://github.com/ludovicchabant/vim-gutentags): Tag file manager
- [obsession](https://github.com/tpope/vim-obsession): Vim sessions manager
- [polyglot](https://github.com/sheerun/vim-polyglot): Language packs
- [startify](https://github.com/mhinz/vim-startify): Start screen
- [vimtex](https://github.com/lervag/vimtex): LaTeX plugin
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Move seamlessly between vim and tmux splits
- [vim-virtualenv](https://github.com/plytophogy/vim-virtualenv): Working with Python virtualenvs
- [yankstack](https://github.com/maxbrunsfeld/vim-yankstack)
