set rtp+=~/.fzf

set t_Co=256

" Python highlighting
let python_highlight_all=1

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd		" Show (partial) command in status line.
set smartcase	" Do smart case matching
set autowrite	" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned

set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
set nospell

set laststatus=2

set hlsearch
set incsearch		" Incremental search

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set switchbuf=useopen,usetab,newtab
set ignorecase
set smartcase

try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" remove header from startify
let g:startify_custom_header = []

" solve meta key not working
let c='a'
set timeout ttimeoutlen=50

let mapleader = ","
let g:mapleader = ","

set encoding=utf-8

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler

set nu
" Relative numbers when not in insert mode,
" normal line numbers when in insert mode
set relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

set nobackup
set nowb
set noswapfile

" Be smart when using tabs
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Use spaces instead of tabs
set expandtab

" Access system clipboard
set clipboard=unnamed

" python PEP8 indentation standards
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

" 2 space tab indentation
au BufNewFile,BufRead *.html,*.tex,*.vim,*.sh
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2

" Highlight unecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//e
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

set path=.,,**

set background=dark
colorscheme gruvbox

set cursorline
set colorcolumn=80

" Remap VIM 0 to first non-blank character
map 0 ^

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" for splits
set splitright
set splitbelow
map <leader>vp :vsplit .<cr>
map <leader>hp :split .<cr>

" send deletes to null register
nnoremap <leader>d "_d

