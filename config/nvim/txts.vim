" dtm/zk/diary/remind stuff
"
" mostly just duplicates of some aliases from zsh (../zsh/aliases/txts.zsh)

"""" diary
command! -nargs=0 Dt exe "e ~/txts/diary/" .. system("date +'%m/%Y_%m_%d' -d '-3 hours'")
" set filetype
" TODO: probably can utilize `vim.filetype.add()`
autocmd BufNewFile,BufRead TODO,~/txts/diary/*/202*
            \ if empty(&filetype) | setlocal ft=markdown | endif

"""" dtm
command! -nargs=0 D e ~/txts/dtm/plans.md
command! -nargs=0 Di e ~/txts/dtm/00_index.md
" disable gitsigns in dtm
autocmd BufNewFile,BufRead ~/txts/dtm/*.md silent! Gitsigns toggle_signs false

"""" inbox
command! -nargs=0 Dw e ~/txts/dtm/inbox/0spn.md
command! -nargs=0 Da e ~/txts/dtm/inbox/00_inboxed.md
command! -nargs=0 Db e ~/txts/dtm/inbox/quteb_saved_urls.md
command! -nargs=0 Bb e ~/txts/synced-inbox/buy.md

"""" zk
command! -nargs=0 Z e ~/txts/zk2/00_INDEX.md
command! -nargs=0 Zi e ~/txts/zk2/inbox/00_INBOX.md
command! -nargs=0 ZI e ~/txts/zk2/inbox/00_INBOX.md

"""" remind/calendar
command! -nargs=0 R e ~/.reminders/main.rem
