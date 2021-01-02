" Plugin manager ( https://github.com/junegunn/vim-plug )
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'svermeulen/vim-subversive'
Plug 'simnalamburt/vim-mundo'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-surround'

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

" commentary

" gitgutter
" update diff hunks when saving file
autocmd BufWritePost * GitGutter
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

" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" lint only on save file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
" open list with errors when has
let g:ale_open_list = 1
" quickfix instead of loclist
" (loclist show errors only from current file,
" quickfix show errors from all opened buffers)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" enable only rust linter
let g:ale_linters_explicit = 1
let g:ale_linters = {'rust': ['cargo']}
" rust lang settings
let g:ale_rust_cargo_use_clippy = 1

" ale-lightline
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

" indexed-search
" limits for perfomance with large files
let g:indexed_search_max_lines = 1000
let g:indexed_search_max_hits = 100
" show format
let g:indexed_search_shortmess = 1
let g:indexed_search_numbered_only = 1

" vim-surround



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

" command for write changes with sudo. Now no need to run vim with sudo.
" Thanks to https://vi.stackexchange.com/a/3566
command! -nargs=0 Sw w !sudo tee % > /dev/null

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

" enable syntax highlight and theme
syntax on
set background=dark
colorscheme ron
