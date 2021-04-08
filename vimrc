" Plugin manager ( https://github.com/junegunn/vim-plug )
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
" TODO: use galaxyline instead of lightline. (after release neovim 0.5)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'svermeulen/vim-subversive'
Plug 'simnalamburt/vim-mundo'
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'lambdalisue/suda.vim'
Plug 'cohama/lexima.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'srcery-colors/srcery-vim'
Plug 'kaicataldo/material.vim', {'branch': 'main'}
Plug 'mhartington/oceanic-next'

" langs specific plugins
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'dart-lang/dart-vim-plugin'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/snippets.nvim'
Plug 'hrsh7th/nvim-compe'

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
            \       [ 'gitstatus', 'readonly', 'filename', 'modified' ]
            \   ],
            \   'right': [
            \       [ 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'filetype', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
            \   ]
            \ },
            \ 'component_function': {
            \   'gitstatus': 'GitStatus'
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
" search references to word under cursor
nmap <leader>fj g*<C-o>:Rg <C-r>/<CR>
" open list mappings (for what?)
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <leader><tab> <plug>(fzf-maps-i)
" complete word from dictionary
" imap <c-x><c-k> <plug>(fzf-complete-word)
" complete path ('fd' instead of 'find')
" imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" complete line
imap <c-x><c-l> <plug>(fzf-complete-line)

function! PInsert2(item)
	let @z=a:item
	norm "zp
	call feedkeys('a')
endfunction

function! CompleteInf()
	let nl=[]
	let l=complete_info()
	for k in l['items']
		call add(nl, k['word']. ' : ' .k['info'] . ' '. k['menu'] )
	endfor 
	call fzf#vim#complete(fzf#wrap({ 'source': nl,'reducer': { lines -> split(lines[0], '\zs :')[0] },'sink':function('PInsert2')}))
endfunction 

" open fzf with current completion list
imap <C-v> <CMD>:call CompleteInf()<CR>

" commentary

" gitgutter
" update diff hunks when saving file
autocmd BufWritePost * GitGutter
" add command alias to fast run gutter after vim start or to use when don't
" want save file but want to see diff chunks
command! -nargs=0 GG GitGutter
command! -nargs=0 Gg GitGutter
" fix losting SignColumn highlight on change colorscheme
autocmd ColorScheme * highlight! link SignColumn LineNr
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction

" fugitive

" subversive
" Replace text-object with content register
" Usage: ["register]s{motion}
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" mundo
nnoremap <F5> :MundoToggle<CR>
let g:mundo_width = 35
let g:mundo_preview_bottom=1
" enable persistent undo
set undofile

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

" vim-toml

" indexed-search
" limits for perfomance with large files
let g:indexed_search_max_lines = 1000
let g:indexed_search_max_hits = 100
" show format
let g:indexed_search_shortmess = 1
let g:indexed_search_numbered_only = 1

" vim-surround

" vim-repeat

" dart-vim-plugin

" nvim-lspconfig
" see ~/.config/nvim/lspconfig.lua

" suda
command! -nargs=0 Sw SudaWrite checktime

" lexima
" fix for work with compe
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

" compe
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    snippets_nvim = true;
  };
}
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" snippets


" Pure vim settings

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

" allow to change layout keyboard in insert mode
set keymap=russian-jcuken
" ^ (command above) changes iminsert, so we restore it to default
set iminsert=0
" map for switching layout
map! <C-s> <C-^>
" restore layout when return to normal mode
inoremap <ESC> <ESC>:set iminsert=0<CR>

" set dictionary complete only for words from spelling
set dictionary=spell
" add russian language to spelling
set spelllang+=ru
" use spell dictionary for complete when spelling is on
set complete+=k

set completeopt=menuone,noselect
" hide completion messages in statusline
set shortmess+=c

" set history limit
set history=1000

" show completions in command-line
set wildmenu
set wildmode=longest:full,full

" enable line numbers
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

" do not allow cursor to be on edges of screen
set scrolloff=15

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

" allow to set cursor to non-symbol place in visual block mode
set virtualedit=block

" replace tab to something printable and viewable
" P.S. possible chars for tab: •, →
set list
set listchars=tab:▸\ 

" set title of window terminal to name and path of the current file
set title
let &titleold=$TERM

" enable syntax highlight and theme
syntax on
set background=dark
" colorscheme ron

" set termguicolors
" colorscheme solarized
" colorscheme molokai

" colorscheme srcery
colorscheme material

