call plug#begin('~/.config/nvim/plugged')

Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'raimondi/delimitmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'

" fzf for fuzzy finding
if has('macunix')
  Plug '/usr/local/opt/fzf'
  Plug '/usr/local/opt/rg'
else
  set rtp+=/usr/bin/fzf
  set rtp+=/usr/bin/rg
endif
Plug 'junegunn/fzf.vim'

Plug 'junegunn/gv.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'parsonsmatt/intero-neovim'
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'shinchu/lightline-gruvbox.vim'

" ncm2 auto-completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
Plug 'ncm2/ncm2-pyclang'

Plug 'luochen1990/rainbow'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/unite.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'ap/vim-buftabline'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'Shougo/vimfiler.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'alx741/vim-hindent'
Plug 'tpope/vim-obsession'
Plug 'airblade/vim-rooter'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'alx741/vim-stylishask'
Plug 'lervag/vimtex'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jmcantrell/vim-virtualenv', {'for': ['python', 'python3']}
Plug 'posva/vim-vue'
Plug 'liuchengxu/vim-which-key'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-unimpaired'
Plug 'ludovicchabant/vim-gutentags'
Plug 'antiagainst/cscope-macros.vim'

call plug#end()

	" call dein#add('tpope/vim-unimpaired')
	" call dein#add('ludovicchabant/vim-gutentags')
filetype plugin indent on
syntax enable
