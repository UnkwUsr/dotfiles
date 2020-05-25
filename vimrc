" Plugin manager ( https://github.com/junegunn/vim-plug )
call plug#begin('~/.vim/plugged')

" "Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
" "Plug 'majutsushi/tagbar'
Plug 'vim-scripts/spacehi.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'

call plug#end()

" auto open NERDTree
" autocmd vimenter * NERDTree
" bind for toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" setup Ctrl as key-modifier for moving lines
let g:move_key_modifier = 'C'

" toggle tagbar
"nmap <F8> :TagbarToggle<CR>
" sort tags by original order, not by name
let g:tagbar_sort = 0
" replace default icons for hide/unhide
let g:tagbar_iconchars = ['+', '-']

" airline
" print unique name file if its double
let g:airline#extensions#tabline#formatter = 'unique_tail'
" enable manage tabs from airline
let g:airline#extensions#tabline#enabled = 1
" draw tabline always
let g:airline#extensions#tabline#tab_min_count = 0
" disable X mouse-button for close tab
let g:airline#extensions#tabline#show_close_button = 0



" enable showing autocomplete when press tab in mode ':'
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
" wrap very long lines
set wrap

" enable syntax highlight
syntax on
colorscheme ron
" highlight trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)

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
" P.S. possible char for tab: •, →
set list
set listchars=tab:▸·

