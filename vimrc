" Plugin manager ( https://github.com/junegunn/vim-plug )
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
"Plug 'majutsushi/tagbar'

call plug#end()


" lightline
let g:lightline = {
            \ 'colorscheme': 'wombat'
            \ }
let g:lightline.active = {
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'filetype' ] ] }
set laststatus=2


" fzf
"anything?


" toggle tagbar
"nmap <F8> :TagbarToggle<CR>
" sort tags by original order, not by name
let g:tagbar_sort = 0
" replace default icons for hide/unhide
let g:tagbar_iconchars = ['+', '-']


" bit of emacs bindings in cmdline
" start/end of line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
" back/forward one character
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
" back/forward one word (why <Esc> in cmdline stands for meta(alt) key?)
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" delete character under cursor
cnoremap <C-D> <Del>

" set history limit
set history=1000

" show completions in command-line
set wildmenu

" draw current number instead '0' by 'relativenumber'
set number
" enable printing current pressed keys in normal mode in bottom right panel
" (for example: typing "d" will print "d" in this panel and then we need to
" press next keys for finish command)
set showcmd

" search settings
" hightlight search
set hlsearch
" search immediatle by typing
set incsearch
set ignorecase
set smartcase
"set nowrapscan

" wrap long lines
set wrap

" enable syntax highlight
syntax on
colorscheme ron
" highlight all trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
" for matching only non-escaped use this regex: '[\\]\@<!\s\+$'

" indent settings
set tabstop=4
set shiftwidth=4
set smarttab
" convert tab symbol to spaces in 'instert' mode
set expandtab
" copy indent from previous line
set autoindent
set smartindent

" replace tab to something printable and viewable
" P.S. possible chars for tab: •, →
set list
set listchars=tab:▸\ 

" add colors for tty session
if !has('gui_running')
    set t_Co=256
endif
