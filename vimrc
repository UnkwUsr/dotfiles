" Plugin manager ( https://github.com/junegunn/vim-plug )
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'svermeulen/vim-subversive'
Plug 'mbbill/undotree'

call plug#end()


" lightline
set laststatus=2
" disable show mode in cmdline, because now we have it on statusline
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'filename', 'modified' ]
            \   ],
            \   'right': [
            \       [ 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'filetype' ]
            \   ]
            \ }
            \}

" fzf
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fg :Rg 
nmap <leader>f/ :Rg <C-r>/
nmap <leader>ft :BTags<CR>
nmap <leader>fT :Tags<CR>
nmap <leader>fh :History<CR>

" gitgutter
" update git diff when saving file
autocmd BufWritePost * GitGutter
" fix losting SignColumn highlight on change colorscheme
autocmd ColorScheme * highlight! link SignColumn LineNr

" subversive
" Replace text-object with content register
" Usage: ["register]s{motion}
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" undotree
nnoremap <F5> :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2


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

" allow switch buffers without saving changes (can save when return)
set hidden

" set history limit
set history=1000

" show completions in command-line
set wildmenu

" print line numbers
set number

" enable printing current pressed keys in normal mode in bottom right panel
" (for example: typing 'd' will print 'd' in this panel and then we need to
" press next keys for finish command)
set showcmd

" disable key code delay (like when in insert mode and pressing <Esc>O )
set ttimeoutlen=0

" search settings
" highlight search
set hlsearch
" search immediately by typing
set incsearch
set ignorecase
set smartcase
"set nowrapscan

" wrap long lines
set wrap
" wrap whole word, instead of one half of word on one line, and other - on
" other line
set linebreak

" set vertical split by right by default(instead of left)
set splitright

" highlight all trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
" for matching only non-escaped use this regex: '[\\]\@<!\s\+$'

" indent settings
set tabstop=4
set shiftwidth=4
set smarttab
" convert tab symbol to spaces in 'insert' mode
set expandtab
" copy indent from previous line
set autoindent
set smartindent

" replace tab to something printable and viewable
" P.S. possible chars for tab: •, →
set list
set listchars=tab:▸\ 

" enable syntax highlight and theme
syntax on
colorscheme ron
