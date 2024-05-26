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
" highlight all trailing spaces
autocmd BufNewFile,BufRead,VimEnter,TermClose * call Match_trailing_spaces()
" with exception for some cases...
autocmd TermOpen * call Unmatch_trailing_spaces()
autocmd FileType git call Unmatch_trailing_spaces()

" enable spell in git-commit
autocmd FileType gitcommit setlocal spell iminsert=0
" set tab size = 2 for some filetypes
autocmd FileType markdown,lisp setlocal sw=2 ts=2
" disable wrap for html and css
autocmd FileType html,css setlocal nowrap
" disable auto-inserting comment on newline for all filetypes
autocmd FileType * setlocal fo-=o
" set commentstring
autocmd FileType cpp,xkb setlocal commentstring=//\ %s
autocmd FileType mysql,plsql setlocal commentstring=--\ %s
autocmd FileType tidal setlocal commentstring=--\ %s
autocmd FileType remind setlocal commentstring=#\ %s
autocmd FileType gnuplot setlocal commentstring=#\ %s
" set colorcolumn
autocmd FileType rust setlocal colorcolumn=100
autocmd FileType python setlocal colorcolumn=88
" set colorscheme
autocmd FileType json colorscheme default

" auto enter insert mode on term open
autocmd TermOpen * startinsert
" hide line numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" play media in background on open
autocmd BufReadCmd *.mp4,*.wav call jobstart('mpv --force-window=immediate ' .. shellescape(expand("%")), {'detach':1}) | bw
autocmd BufReadCmd *.png,*.jpg call jobstart('feh --start-at ' .. shellescape(expand("%")), {'detach':1}) | bw

" fix reporting cwd on :cd (https://github.com/neovim/neovim/issues/21771)
autocmd DirChanged * call chansend(v:stderr, printf("\033]7;%s\033\\", v:event.cwd))
autocmd VimLeave * call chansend(v:stderr, "\033]7;\033\\")

" highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" auto jump to last cursor position in each opened file (from benknoble's dotfiles)
augroup vimrc_last_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'gitcommit' |
        \   exe "normal! g`\"" |
        \ endif
augroup end
