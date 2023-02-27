call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'svermeulen/vim-subversive'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'lambdalisue/suda.vim'
Plug 'windwp/nvim-autopairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vifm/vifm.vim'
Plug 'stsewd/gx-extended.vim'

" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
Plug 'srcery-colors/srcery-vim'
" Plug 'kaicataldo/material.vim'
" Plug 'mhartington/oceanic-next'

" langs specific plugins
Plug 'chrisbra/csv.vim'
Plug 'tidalcycles/vim-tidal'
Plug 'neovimhaskell/haskell-vim'
" parenthesis guesser for lisp-like syntax languages
Plug 'gpanders/nvim-parinfer'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'mickael-menu/zk-nvim'
Plug 'folke/neodev.nvim'

" dependencies
" null-ls
Plug 'nvim-lua/plenary.nvim'

call plug#end()


" lightline
set laststatus=3
" disable show mode in cmdline, because now we have it on statusline
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'relativepath', 'modified' ],
            \       [ ]
            \   ],
            \   'right': [
            \       [ 'lines' ],
            \       [ 'spell', 'words' ],
            \       [ 'lsp_status', 'filetype' ]
            \   ]
            \ },
            \ 'tabline': {
            \   'left': [ [ 'tabs' ] ],
            \   'right': [ ]
            \ },
            \ 'component': {
            \   'lines': '%L',
            \ },
            \ 'component_function': {
            \   'lsp_status': 'LspStatus',
            \   'spell': 'SpellStatus',
            \   'words': 'WordsCount'
            \ }
            \}
function! LspStatus() abort
    return luaeval('Lua_LspStatus()')
endfunction

function! WordsCount() abort
    " if &filetype =~# '\v(tex|markdown)'
    if &filetype != 'markdown'
        return ''
    endif
    let ws = wordcount()
    if has_key(ws, 'visual_words')
        return ws.visual_words . 'vw'
    else
        return ws.words . 'w'
    endif
endfunction

function! SpellStatus() abort
    if &spell == 1
        return 'spell'
    else
        return ''
    endif
endfunction

" fzf
nmap <leader>ff :Files<CR>
nmap <leader>fF :Files %:h<CR>
nmap <leader>fl :GFiles?<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fg :Rg 
nmap <leader>f/ :Rg <C-r>/
nmap <leader>ft :Tags<CR>
nmap <leader>fT :BTags<CR>
nmap <leader>fh :History<CR>
nmap <leader>f? :Helptags<CR>
" search references for tag/word under cursor
nmap <leader>fj g*N:Tags <C-r>/<CR>
nmap <leader>fJ g*N:Rg <C-r>/<CR>
" open list mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <leader><tab> <plug>(fzf-maps-i)

function! PInsert2(item)
    let @z=a:item
    norm "zp
    call feedkeys('a')
endfunction

" commentary

" fugitive
" always open fugitive in new tab
cabbrev G tab G
" map q to exit. Complements gv.vim behavior
autocmd FileType git nmap <buffer> q :q<CR>

" not fugitive, but for git. proper use `git fxa` alias
command! -nargs=0 Gfxa term git fxa

" gv
" restore 'o' in visual mode to native behavior
autocmd FileType GV xunmap <buffer> o
nmap <leader>ag :GV<CR>

" subversive
" Replace text-object with content register
" Usage: ["register]s{motion}
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" undotree

" rust-lang
function! s:find_cargo_root()
    let cargo_file = findfile('Cargo.toml', '.;')
    return !empty(cargo_file) ? fnamemodify(cargo_file, ':p:h') : ''
endfunction
" set tags file for cargo project
function! s:set_cargo_tags_file()
    let cargo_folder = s:find_cargo_root()
    let &l:tags = cargo_folder . '/tags'
endfunction
autocmd BufRead *.rs call s:set_cargo_tags_file()
" generate tags for cargo project
function! s:generate_cargo_rust_tags()
    let cargo_folder = s:find_cargo_root()
    if !empty(cargo_folder)
        let cmd =  "!ctags -R -o " . cargo_folder . '/tags ' . cargo_folder . '/src &'
        :silent! exec cmd | redraw!
    endif
endfunction
autocmd BufWritePost *.rs call s:generate_cargo_rust_tags()

" suda
command! -nargs=0 Sw SudaWrite

" nvim-lspconfig
" for lspconfig config see ~/.config/nvim/lua/user/lsp
" just shorter alias
cabbrev LS LspStart

" netrw (installed by default)
" also a little bit configured by vim-vinegar
let g:netrw_winsize = 25
" hide dotfiles
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" markdown-preview
let g:mkdp_port = '8215'
nmap <leader>am :MarkdownPreview<CR>

" vifm
nmap - :Vifm<CR>

" csv.vim
let g:csv_autocmd_arrange = 1
let g:csv_arrange_align = 'r*'

" tidal
let g:tidal_target = "terminal"


" Pure vim settings

" bit of emacs bindings in cmdline
" start/end of line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
" back/forward one character
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
" back/forward one word
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>
" delete character under cursor
cnoremap <C-D> <Del>

" quit vim faster
nmap Q :q<CR>

"""" perf
" limit syntax highlight for long lines
set synmaxcol=1000
" disable loading useless providers. It boost startup
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" copy from default yank register to system clipboard
nmap <leader>y :let @+=@"<CR>:echo 'copied to system buffer'<CR>

" allow switch buffers without saving changes (can save when return)
set hidden

" allow to change layout keyboard in insert mode
set keymap=russian-jcukenwin
" ^ (command above) changes iminsert, so we restore it to default
set iminsert=0
" fix russian layout
imap № #
" maps for switching keyboard layout
map! <C-s> <C-^>
nmap <C-s> a<C-^><ESC>
" restore layout when return to normal mode
" inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

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

" toggle spell
nmap <leader>s :set spell!<CR>

" cd to directory of current opened file
nmap <leader>c :cd %:h<CR>

" jump to next/previous buffer
nnoremap <silent><C-n> :bnext<CR>
nnoremap <silent><C-p> :bprevious<CR>

" create and open file under cursor
nnoremap cgf :e <cfile><CR>

" format paragraph
nmap gwp gwip

" swap maps because shorter one is used more often
nnoremap g_ $
nnoremap $ g_l

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
set shada^=r/tmp/,rfugitive:,rzipfile:,rman:,rhttp:,rhttps:

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

function! Match_trailing_spaces()
    if !exists('w:match_trailing_spaces')
        let w:match_trailing_spaces = matchadd('ErrorMsg', '\s\+$', -1)
        " for matching only non-escaped use this regex: '[\\]\@<!\s\+$'
    endif
endfunction
function! Unmatch_trailing_spaces()
    if exists('w:match_trailing_spaces')
        call matchdelete(w:match_trailing_spaces)
        unlet w:match_trailing_spaces
    endif
endfunction
" highlight all trailing spaces, except for in term buffer
autocmd BufNewFile,BufRead,VimEnter,TermClose * call Match_trailing_spaces()
autocmd TermOpen * call Unmatch_trailing_spaces()

" enable spell in git-commit
autocmd FileType gitcommit setlocal spell iminsert=0
" set tab size = 2 for some filetypes
autocmd FileType markdown,lisp setlocal sw=2 ts=2
" disable wrap for html and css
autocmd FileType html,css setlocal nowrap
" disable auto-inserting comment on newline for all filetypes
autocmd FileType * setlocal fo-=o
" set commentstring
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType mysql,plsql setlocal commentstring=--\ %s
autocmd FileType tidal setlocal commentstring=--\ %s
autocmd FileType remind setlocal commentstring=#\ %s
autocmd FileType gnuplot setlocal commentstring=#\ %s
" set colorcolumn
autocmd FileType rust setlocal colorcolumn=100

" auto enter insert mode on term open
autocmd TermOpen * startinsert

" highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" fzf over files in ~/.dotfiles
command! -nargs=0 Sd cd ~/.dotfiles/ | FZF

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

" enable syntax highlight and theme
syntax on
set background=dark
" colorscheme ron

" set termguicolors
" colorscheme solarized
" colorscheme molokai

colorscheme srcery
hi SpellBad ctermfg=3

" fix srcery colorscheme for Haskell
hi! link haskellType SrceryYellow
hi! link haskellOperators SrceryYellow
hi! link haskellConditional SrceryCyan
hi! link haskellLet SrceryYellow

" colorscheme material

" disable syntax highlighting in diff mode (vimdiff)
if &diff
    syntax off
endif
