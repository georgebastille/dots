set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'nvie/vim-flake8'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

set showcmd		        " display incomplete commands
set mouse=a
" Do not attempt to connect to remote X Server clipboard
set clipboard=exclude:.*
let mapleader      = ' '
let maplocalleader = ' '

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

set splitbelow
set splitright

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<cr>
nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>r :History:<CR>
nnoremap <silent> <Leader>m :Make<CR>
nnoremap <silent> <Leader>v <C-W>v
nnoremap <silent> <Leader>s <C-W>s
nnoremap <silent> <Leader>n :noh<CR>
nnoremap <leader>w :update<cr>

" Annoying temporary files
" set backupdir=/tmp//,.
" set directory=/tmp//,.
" if v:version >= 703
"   set undodir=/tmp//,.
" endif

" Save

set background=dark
colorscheme elflord

set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

" Automatically save before running make
set autowrite

filetype plugin indent on
" show existing tab with 4 spaces width
" set tabstop=4
" when indenting with '>', use 4 spaces width
" set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab
autocmd FileType javascript set shiftwidth=2


" Use %% as the path of the current buffer (without the filename)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set hlsearch
set number relativenumber

set path+=**
set wildmenu
set wildmode=longest:full,full

if has("gui_running")
    " set macvim specific stuff
    set guifont=Ubuntu\ Mono:h18
    set clipboard=unnamed
    " change cursor btw Normal & Insert mode
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Call Flake8 on save for Python files
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1  " show

" Go https://github.com/fatih/vim-go/wiki/Tutorial#quick-setup
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>m :<C-u>call <SID>build_go_files()<CR>


"set cscopequickfix=s-,c-,d-,i-,t-,e-
"set nocscopetag
