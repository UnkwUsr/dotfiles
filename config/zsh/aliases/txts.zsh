#### txts aliases (note taking, planning, etc.)
#
# NOTE: my knowledge-bases are assisted with zk: https://github.com/zk-org/zk

# aliases naming legend (applies to dtm/plans, zk, and few other):
# .i - Index (open index file)
# .s - Search (search through base with fzf)
# .d - Directory (cd into)
# . - just opens main entry point
#
# example:
# d - open main dtm entry point
# di - open dtm index
# ds - dtm search
# dtmd - cd into dtm directory (this is exception, but suffix `d` still here)


### dtm - plans, tasks, thoughts/ideas
# (historically it named "dtm", but now most binds starts with just "d")

alias di="cd ~/txts/dtm && vim 00_index.md && cd - > /dev/null"
alias dtmd="cd ~/txts/dtm && pwd"
alias ds="cd ~/txts/dtm && zk edit -i -s modified"
# inbox, part of dtm, most often entry point. Playground for thoughts, etc.
alias d="cd ~/txts/dtm && vim plans.md && cd - > /dev/null"
# nctok over dtm
alias dtmn='cd ~/txts/dtm/ && zk_graph_for_nctok.py 00_index.md | nctok --path-separator="|"'
# open random task
alias randtask='vim "$(fd . -tf ~/txts/dtm/ | shuf -n1)"'


### semi-sorted inbox repo (aka dtm pre-staging area)

alias dwd="cd ~/txts/dtm/inbox"
# saved notes from i3 bind
alias da="cd ~/txts/dtm/inbox/ && vim +':norm G' 00_inboxed.md && cd - > /dev/null"
# saved links from browser
alias db="cd ~/txts/dtm/inbox && vim quteb_saved_urls.md"

# add to inbox right from cli. Yes
ibn() { echo "* from ibn: $*" >> ~/txts/dtm/inbox/00_inboxed.md }

# buy list
alias bb="cd ~/txts/synced-inbox && vim buy.md && cd - > /dev/null"

### phone inbox
alias nbd="cd ~/txts/synced-inbox/ && git s && ll"


### zk - zettel notes

alias z="cd ~/txts/zk2 && vim 00_INDEX.md"
alias zs="cd ~/txts/zk2 && zk edit -i -s modified"
alias zd="cd ~/txts/zk2 && pwd"


### manylists - list of media like films, anime and books
# (name history: originally it was for anime titles only)

alias ani="cd ~/txts/manylists && vim 00_MAIN.md"
alias anis="cd ~/txts/manylists && zk edit -i -s modified"
alias anid="cd ~/txts/manylists && pwd"


### remind/calendar ("tasks on time")

# view today
alias rem='rem -m -@'
# view current week
alias rem1='clear; rem -cl+1 -w,3,0'
# view current and next week
alias rem2='clear; rem -cl+2 -w,3,0'
# view current and previous week
alias rem2p='clear; rem -cl+2 -w,3,0 $(date -d"-7 day" +"%d %b %Y")'
# view current and 2 next weeks
alias rem3='clear; rem -cl+3 -w,3,0'
# view whole year
alias remy='rem -cl+53 -w150,3,0 | less -r'

# mark as done repeatable reminds
alias remd='~/.reminders/mark_done.sh'
# edit reminds (kind of entry point for reminds)
# '+args\ %' hack to suppress 'E173: 1 more file to edit' warning
alias reme='cd ~/.reminders && vim +args\ % main.rem repeats.rem'


### diary

alias dtd="cd ~/txts/diary && pwd"
# open today diary file
# -3 hours offset for the case when now is "2022-01-02 01:15" and I want to
# write diary for "2022-01-01"
alias dt='cd ~/txts/diary/$(date +"%m" -d "-3 hours") && \
    vim $(date +"%Y_%m_%d" -d "-3 hours") && cd - > /dev/null'

# get week day name and months name
# TODO: open selected date in diary
dats() {
    back=${1:-1}
    yes "$(date +%s -d "-$back years")" \
        | head -n $((365 * ($back))) \
        | gawk '{printf "%s\n", strftime("%Y-%m-%d %A %B", $1 + 60 * 60 * 24 * NR)}' \
        | fzf +s
}
