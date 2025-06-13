" Pure vim settings

"""" perf
" limit syntax highlight for long lines
set synmaxcol=1000
" disable loading useless providers. It boost startup
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" allow switch buffers without saving changes (can save when return)
set hidden

" allow to change layout keyboard in insert mode
set keymap=russian-jcukenwin
" ^ (command above) changes iminsert, so we restore it to default
set iminsert=0

" set dictionary complete only for words from spelling
set dictionary=spell
" add russian language to spelling
set spelllang+=ru
" limit suggested words list
set spellsuggest+=9
" recognize camel case in spelling
set spelloptions=camel
" disable check of capital letter at the start of the sentence
set spellcapcheck=""
" use spell dictionary for completion (applies on spelling turning on)
set complete+=k
" disable tags completion
set complete-=t

set completeopt=menuone,noselect
" hide completion messages in statusline
set shortmess+=c

" don't show intro on start with empty buffer
set shortmess+=I

" set cmd history limit
set history=1000
" set recent files history limit to 500
set shada^='500
" do not save temp files in history
set shada^=r/proc/,rfugitive:,rzipfile:,rman:,rhttp:,rhttps:,rgv:

" show completions in command-line
set wildmenu
set wildmode=longest:full,full

" enable line numbers relative to cursor line
set relativenumber
set number

" enable printing current pressed keys in normal mode in bottom right panel
" (for example: typing 'd' will print 'd' in this panel and then we need to
" press next keys for finish command)
set showcmd

" disable delay for key code sequences (example: in insert mode press <Esc>O)
set nottimeout
" the same as:
" set ttimeoutlen=0

" disable timeout for mappings (especially for <Leader> key) (will wait
" forever till map is completed or other key is pressed)
set notimeout
" the same as:
" set timeoutlen=99999999

" save swap files to /tmp (RAM)
set directory=/tmp/.vim_swap

" enable persistent undo
set undofile

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

" do not allow cursor to be on edges of screen
set scrolloff=15

" set vertical split by right by default(instead of left)
set splitright

" indent settings
set tabstop=4
set shiftwidth=4
set smarttab
" convert tab symbol to spaces in 'insert' mode
set expandtab
" copy indent from previous line
set autoindent
set smartindent

" highlight line length limit
set colorcolumn=80
" highlight whole line under cursor
set cursorline

" floating windows border
set winborder=rounded

" allow to set cursor to non-symbol place in visual block mode
set virtualedit=block

" replace tab to something printable and viewable
" P.S. possible chars for tab: •, →
set list
set listchars=tab:▸\ 

" set title of window terminal to name and path of the current file
set title
let &titleold=$TERM

" disable mouse support
set mouse=
