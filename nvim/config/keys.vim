" vim-plug
map <leader>pi :PlugInstall<cr>
map <leader>pu :PlugUpdate<cr>

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $i <esc>I\item <esc>A

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Ctrl-{hjkl} for navigating out of terminal panes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Mappings for managing tabs
map <leader>tn :tabnew .<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
" map <leader>sa zg
map <leader>s? z=
map <leader>p :echo expand('%')<cr>
map <leader>cn :cn<cr>
map <leader>cp :cn<cr>

map <leader>todo :vimgrep TODO %<cr>:cw<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" buffer mappings
nnoremap <C-N> :bnext<cr>
nnoremap <C-P> :bprev<cr>
map <leader>w :bd<cr>

" for splits
set splitright
set splitbelow
map <leader>vp :vsplit .<cr>
map <leader>hp :split .<cr>

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" send deletes to null register
nnoremap <leader>d "_d

" paste mode toggle
set pastetoggle=<leader>z

nnoremap c* /\<<C-R>=expand('<cword>')<cr>\>\C<cr>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<cr>\>\C<cr>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<cr>\>\C<cr>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<cr>\>\C<cr>``dgN

" VimFiler
map <leader>vf :VimFilerBufferDir<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" fzf
map <leader>o :FZF<cr>
" ripgrep
map <leader>f :Rg<cr>

" Startify
map <leader>s :Startify<cr>

" sudo save to avoid permission denied
" command W w !sudo tee % > /dev/null

" function! Paste(regname, pasteType, pastecmd)
"   let reg_type = getregtype(a:regname)
"   call setreg(a:regname, getreg(a:regname), a:pasteType)
"   exe 'normal "'.a:regname . a:pastecmd
"   call setreg(a:regname, getreg(a:regname), reg_type)
" endfunction
" nmap <Leader>lP :call Paste(v:register, "l", "P")<CR>
" nmap <Leader>lp :call Paste(v:register, "l", "p")<CR>
" nmap <Leader>cP :call Paste(v:register, "v", "P")<CR>
" nmap <Leader>cp :call Paste(v:register, "v", "p")<CR>
" nmap <Leader>bP :call Paste(v:register, "b", "P")<CR>
" nmap <Leader>bp :call Paste(v:register, "b", "p")<CR>
"
" function! PasteJointCharacterwise(regname, pastecmd)
"   let reg_type = getregtype(a:regname)
"   call setreg(a:regname, '', "ac")
"   exe 'normal "'.a:regname . a:pastecmd
"   call setreg(a:regname, '', "a".reg_type)
"   exe 'normal `[v`]J'
" endfunction
" nmap <Leader>p :call PasteJointCharacterwise(v:register, "p")<CR>
" nmap <Leader>P :call PasteJointCharacterwise(v:register, "P")<CR>

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

map <leader>tb :TagbarOpen j<cr>
map <leader>nt :NERDTree<cr>
