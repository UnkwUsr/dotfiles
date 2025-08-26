call plug#begin()

"""" looking, theming
Plug 'srcery-colors/srcery-vim'
Plug 'itchyny/lightline.vim'

"""" utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'UnkwUsr/fzf.vim'
Plug 'mbbill/undotree'
Plug 'vifm/vifm.vim'
" better vim defaults
Plug 'UnkwUsr/gx.nvim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tummetott/unimpaired.nvim'
" linux utils
Plug 'tpope/vim-eunuch'
Plug 'lambdalisue/suda.vim'
" text editing itself utils
Plug 'svermeulen/vim-subversive'
Plug 'tpope/vim-surround'
" git stuff
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }
Plug 'UnkwUsr/vim-fugitive' " fork from tpope
Plug 'junegunn/gv.vim'

"""" langs specific plugins
" Plug 'chrisbra/csv.vim'
Plug 'tidalcycles/vim-tidal'
Plug 'neovimhaskell/haskell-vim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'udalov/kotlin-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'davidgranstrom/scnvim'
Plug 'mcfiredrill/vim-liquidsoap'
" for lisp-like syntax languages (parenthesis guesser)
Plug 'gpanders/nvim-parinfer'
" for note taking, in markdown
Plug 'zk-org/zk-nvim'
" for neovim's lua api (providing completion)
Plug 'folke/neodev.nvim'
" for many languages
Plug 'nvimtools/none-ls.nvim'
Plug 'michaelb/sniprun', {'do': 'sh install.sh'}
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vista.vim'
" detect indent style (tab vs space) and set appropriate options
Plug 'Darazaki/indent-o-matic'

"""" lsp itself stuff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
" completion stuff
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

"""" dependencies
" null-ls
Plug 'nvim-lua/plenary.nvim'
" vim-surround
Plug 'tpope/vim-repeat'

call plug#end()


" srcery (colorscheme)
set notermguicolors
colorscheme srcery
" fix spell color
hi SpellBad ctermfg=3 cterm=underline
" fix colors for Haskell
" TODO: probably this not applying now
hi! link haskellType SrceryYellow
hi! link haskellOperators SrceryYellow
hi! link haskellConditional SrceryCyan
hi! link haskellLet SrceryYellow
" fix markdown list marker color
autocmd FileType markdown hi! link markdownListMarker SrceryYellow

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
            \       [ 'lsp_status' ]
            \   ],
            \   'right': [
            \       [ 'lines' ],
            \       [ 'spell', 'words' ],
            \       [ 'lsp_clients', 'filetype' ]
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
            \   'lsp_clients': 'LspClients',
            \   'spell': 'SpellStatus',
            \   'words': 'WordsCount'
            \ }
            \}
function! LspStatus() abort
    return luaeval('Lua_LspStatus()')
endfunction
function! LspClients() abort
    return luaeval('Lua_LspClients()')
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
nmap <leader>fL :GFiles<CR>
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
vmap <leader>fJ "vy:Rg <C-r>v<CR>
" open list mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <leader><tab> <plug>(fzf-maps-i)

" fugitive
" always open fugitive in new tab
cabbrev G tab G
" map q to exit. Complements gv.vim behavior
autocmd FileType git nmap <buffer> q :q<CR>
" not fugitive, but for git: proper use `git fxa` alias
command! -nargs=0 Gfxa term git fxa

" gv
nmap <leader>ag :GV<CR>
" restore 'o' in visual mode to native behavior
autocmd FileType GV xunmap <buffer> o
" make o behave as O in normal mode (open commit in tabs)
autocmd FileType GV nmap <buffer> o O
" fix mess with tabs (example: when use O in GV): move GV tab to last
" (and have to set after VimEnter, otherwise it breaks when open GV on start)
autocmd VimEnter * autocmd FileType GV tabmove $
" fix to prevent GV buffer appearing in oldfiles list. Also see 'shada'
" setting
autocmd FileType GV exe "file gv://" . bufname()

" specific paragraph binds for dotfiles repo git log
autocmd FileType GV if @% =~ 'gv://.dotfiles*' | call <sid>mydotfiles_map_nav() | endif
autocmd FileType gitrebase if expand("%:p") =~ '\/.dotfiles\/' | call <sid>mydotfiles_map_nav() | endif
function! s:mydotfiles_map_nav()
    " matches: file start, file end, ' ----', branch tags and empty lines
    let l:regex = '\\\%^\\\| ----\\\|^\\\* .\\\{21}(\\\|^$\\\|\\\%$'
    exec ':nmap <buffer> <silent> { :call search("' . l:regex . '", "Wb")<CR>:norm ^<CR>'
    exec ':nmap <buffer> <silent> } :norm ^j<CR>:call search("' . l:regex . '", "W")<CR>:norm ^<CR>'
endfunction

" override bind 'O'. Enable showing root commit and add stat info
autocmd FileType GV nnoremap <silent> <buffer> O :call <sid>mygvopen(0)<cr>
" also my brand new to show semantic diff
autocmd FileType GV nnoremap <silent> <buffer> T :call <sid>mygvopen(1)<cr>
function! s:mygvopen(semantic_diff)
  let sha = gv#sha()
  if !empty(sha)
      if !a:semantic_diff
          execute 'tab term git sh ' . sha . ' | diff-so-fancy'
          setfiletype git
          " exit terminal insert mode
          call feedkeys("\<C-\>\<C-n>")
      else
          execute 'tab term git tsh ' . sha
          " not exiting terminal here, because difft prints colors only in
          " when printing to less natively, so we will use it to see colors
      endif
  endif
endfunction

" vista
nmap =- :Vista<CR>

" subversive
" Replace text-object with content register
" Usage: ["register]s{motion}
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

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

" netrw (installed by default)
" also a little bit configured by vim-vinegar
let g:netrw_winsize = 25
" hide dotfiles
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" open external links (like http://, etc.) without asking 'press enter' after
" download
let g:netrw_silent = 1

" markdown-preview
let g:mkdp_port = '8215'
let g:mkdp_browser = 'brave'
let g:mkdp_echo_preview_url = 1
" refresh only on file save
let g:mkdp_refresh_slow = 1
nmap <leader>am :MarkdownPreview<CR>

" vifm
nmap - :Vifm<CR>

" csv.vim
let g:csv_autocmd_arrange = 1
let g:csv_arrange_align = 'r*'

" tidal
let g:tidal_target = "terminal"
" force use ghci from system package manager to prevent colliding with ghcup
let g:tidal_ghci = "/bin/ghci"

" suda
command! -nargs=0 Sw SudaWrite

" nvim-lspconfig
" for lspconfig config see ~/.config/nvim/lua/user/lsp
" just shorter alias
cabbrev LS LspStart
