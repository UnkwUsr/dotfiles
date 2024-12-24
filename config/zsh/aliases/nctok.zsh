# nctok helpers (https://github.com/UnkwUsr/nctok)

# just files count in directory. Actually each file just have number "1"
byfiles() {
    fd -tf $* | sed 's/^/1 /' | nctok
}

# pattern matches count per file
bymatch() {
    rg "$1" --count-matches --null | awk -F '\0' '{print $2, $1}' | nctok
}

# with tokei
_tokei_helper() {
    target="$1"; shift
    tokei -Cfo json $* \
        | jq -r '.[].reports[] | "\(.stats.'$target') \(.name | ltrimstr("./"))"' \
        | nctok
}
# by code
alias bycode="_tokei_helper code"
# by comments
alias bycmnts="_tokei_helper comments"
# by blanks
alias byblanks="_tokei_helper blanks"

# # dead with scc
# _scc_helper() {
#     num="$1"; shift
#     scc --no-complexity --by-file -f csv $* \
#         | awk -v OFS=" " -F"," '{print $'$num',$2}' \
#         | head -n-1 | tail -n+2 | nctok
# }
# # by code
# alias by_code="_scc_helper 5"
# # by comments
# alias by_cms="_scc_helper 6"
# # by blanks
# alias by_blanks="_scc_helper 7"

# by commits for each file
bycommits() {
    git log --name-only --format="" \
        | grep -v '^$' \
        | perl -lne 'print if -e' \
        | sed 's/^/1 /' | nctok

        # TODO: seems this is better:
        # | sort | uniq -c | sed 's/^\s*//' | nctok
}

# by lines in files
bylines() {
    fd -tf --strip-cwd-prefix --exec-batch \
        wc -l --total=never \
        | sed 's/^\s*//' | nctok
}
