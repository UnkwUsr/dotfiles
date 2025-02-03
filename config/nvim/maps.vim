"""" cmdline
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


"""" basic stuff
" quit vim faster
nmap Q :q<CR>
" format paragraph
nmap gwp gwip
" swap maps because shorter one is used more often
nnoremap g_ $
nnoremap $ g_l
" jump to next/previous buffer
nnoremap <silent><C-n> :bnext<CR>
nnoremap <silent><C-p> :bprevious<CR>


"""" toggles
" toggle spell
nmap <leader>s :setlocal spell!<CR>
" toggle wrap
nmap <leader>w :setlocal wrap!<CR>
" switching keyboard language layout
map! <C-s> <C-^>
nmap <C-s> a<C-^><ESC>
" restore layout when return to normal mode
" inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>


"""" utils/actions
" copy from default yank register to system clipboard
nmap <leader>y :let @+=@"<CR>:echo 'copied to system buffer'<CR>
" cd to directory of current opened file
nmap <leader>c :cd %:h<CR>
" create and open file under cursor
nnoremap cgf :e <cfile><CR>
" fix russian layout
imap № #


"""" commands
" fzf over files in ~/.dotfiles
command! -nargs=0 Sd cd ~/.dotfiles/ | FZF

" accepts vim command, executes it and puts output to the new buffer for vim
" natural navigating, instead of crapped view window
" Source: https://vi.stackexchange.com/a/8379/46823
command! -nargs=+ -complete=command Redir let s:reg = @@ | redir @"> | silent execute <q-args> | redir END | new | pu | 1,2d_ | let @@ = s:reg

" shell execute line under the cursor
nmap <leader>el "lyy:!<C-r>l<CR>
