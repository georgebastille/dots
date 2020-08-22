set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:python3_host_prog = expand('~/miniconda3/envs/neovim/bin/python')

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
"Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
"Plug 'nvie/vim-flake8'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'sheerun/vim-polyglot'
Plug 'psf/black', { 'for': 'python', 'tag': '19.10b0' } " https://github.com/psf/black/issues/1293#issuecomment-596123193
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tomasr/molokai'
call plug#end()

set showcmd		        " display incomplete commands
set mouse=a
" Do not attempt to connect to remote X Server clipboard
" set clipboard=exclude:.*
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

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

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
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" Save

"set background=dark
silent! colorscheme molokai
"colorscheme elflord

set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

" Automatically save before running make
set autowrite

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
autocmd FileType javascript set shiftwidth=2


" Use %% as the path of the current buffer (without the filename)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set hlsearch
set incsearch
set ignorecase
set smartcase

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
" Deprecated by black
" autocmd BufWritePost *.py call Flake8()
" let g:flake8_show_in_gutter=1  " show

" Run Black on save.
autocmd BufWritePre *.py execute ':Black'

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

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"set cscopequickfix=s-,c-,d-,i-,t-,e-
"set nocscopetag
let g:deoplete#enable_at_startup = 1
" https://www.reddit.com/r/neovim/comments/6j9vcv/help_with_deoplete_autocompletion/
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"call deoplete#custom#option('auto_complete_popup', 'manual')
"inoremap <expr> <C-n>  deoplete#complete()

" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return deoplete#smart_close_popup() . "\<CR>"
"endfunction
"inoremap <silent><expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"


" Use the global executable with a special name for flake8.
let g:ale_python_flake8_executable = expand('~') . '/miniconda3/envs/neovim/bin/flake8'
let g:ale_python_flake8_use_global = 1
" Use the global executable with a special name for flake8.
let g:ale_python_mypy_executable = expand('~') . '/miniconda3/envs/neovim/bin/mypy'
let g:ale_python_mypy_use_global = 1
" Use the global executable with a special name for flake8.
let g:ale_python_isort_executable = expand('~') . '/miniconda3/envs/neovim/bin/isort'
let g:ale_python_isort_use_global = 1
" Use the global executable with a special name for flake8.
"let g:ale_python_black_executable = expand('~') . '/miniconda3/envs/neovim/bin/black'
"let g:ale_python_black_use_global = 1

let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
let g:ale_fixers = {
\   'python': ['isort']
\}
let g:ale_fix_on_save = 1

