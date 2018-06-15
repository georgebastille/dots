set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-unimpaired'
Plug 'keith/swift.vim'
Plug 'tpope/vim-vinegar'
"Plug 'lifepillar/vim-solarized8'
Plug 'nvie/vim-flake8'
"Plug 'vim-scripts/a.vim'
call plug#end()

set showcmd		        " display incomplete commands
set mouse=a
"set clipboard=unnamed
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

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap §   <c-w>w
nnoremap ±   <c-w>W

nnoremap <silent> <Leader><Leader>  :Files<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>r :History:<CR>

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" Save
"inoremap <C-s> <C-O>:update<cr>
"nnoremap <C-s> :update<cr>
nnoremap <leader>s :update<cr>
"nnoremap <leader>w :update<cr>

" Colon goodness
"nnoremap ; :
"nnoremap : ;

"let g:solarized_use16 = 1
set background=dark
"colorscheme base16-solarized-dark
"colorscheme solarized8

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set guifont=Menlo:h15

" change cursor btw Normal & Insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Use %% as the path of the current buffer (without the filename)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Unmap A.vim insert mode leader keys
"silent! iunmap <Space>ihn
"silent! iunmap <Space>is
"silent! iunmap <Space>ih


" From https://github.com/vim/vim/issues/2490#issuecomment-393973253
function! ExitNormalMode()
    unmap <buffer> <silent> <RightMouse>
    call feedkeys("a")
endfunction

function! EnterNormalMode()
    if &buftype == 'terminal' && mode('') == 't'
        call feedkeys("\<c-w>N")
        call feedkeys("\<c-y>")
        map <buffer> <silent> <RightMouse> :call ExitNormalMode()<CR>
    endif
endfunction

tmap <silent> <ScrollWheelUp> <c-w>:call EnterNormalMode()<CR>
