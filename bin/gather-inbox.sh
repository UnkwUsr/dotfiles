#!/bin/bash
set -euo pipefail
shopt -s nullglob

TARGET_TO="$HOME/txts/dtm/plans.md"

me_whisper() {
    src_dir="$1"
    dest_file="$2"
    # have to instal with `uv tool install whisper-ctranslate2`
    whisper-ctranslate2 -f txt -o "$src_dir" --language ru "$src_dir/"*.wav
    for x in "$src_dir"/*.txt; do
        (tr '\n' ' ' < "$x" | sed -e 's/^/* /' \
            && echo "${x//.txt/.wav}") \
            >> "$dest_file"
        rm "$x"
    done
}

voice_recognise() {
    if [ -d voices ]; then
        cd voices
        ls -1 ./*.m4a | xargs -I{} ffmpeg -hide_banner -i {} -ar 16000 {}.wav
        cd -
        me_whisper voices voices-res.md
    fi
    if [ -d voices-laptop ]; then
        me_whisper voices-laptop laptop-voices-res.md
    fi
}

copy_into_target() {
    for d in ./inbox_*.md ; do
        echo -e "\n## from $d" >> "$TARGET_TO"
        echo "$d"
        cat <(echo) "$d" >> "$TARGET_TO"
    done

    [ -f voices-res.md ] && cat <(echo -e "\n## voices\n") voices-res.md >> "$TARGET_TO"
    [ -f laptop-voices-res.md ] && cat <(echo -e "\n## laptop\n") laptop-voices-res.md >> "$TARGET_TO"

    fd . -HI -tf \
        --exclude=voices-res.md \
        --exclude=laptop-voices-res.md \
        --exclude=voices/ \
        --exclude=voices-laptop/ \
        --exclude='inbox_*.md' \
        --exclude=buy.md \
        --exclude=.git/ \
        | ifne cat <(echo -e "\n## WARNING: other files also\n") - >> "$TARGET_TO"
}

final_clean() {
    [ -f voices-res.md ] && rm voices-res.md
    [ -f laptop-voices-res.md ] && rm laptop-voices-res.md
    [ -d voices ] && (git rm voices/*.m4a && mkdir -p ~/txts/dtm/voices && mv voices/*.wav ~/txts/dtm/voices && rmdir voices)
    [ -d voices-laptop ] && (mkdir -p ~/txts/dtm/voices-laptop && mv voices-laptop/*.wav ~/txts/dtm/voices-laptop && rmdir voices-laptop)
    files=( ./inbox_*.md ) && (( ${#files[@]} )) && git rm "${files[@]}"

    # also add buy.md at the same time. Why not
    git add buy.md

    if commit_res="$(git commit -m "gather auto at $(date)")"; then
        git push
    else
        if [[ "$commit_res" =~ "nothing to commit, working tree clean" ]]; then
            # special handling because otherwise it returns with exit code = error
            return 0
        elif [[ "$commit_res" =~ "nothing added to commit but untracked files present" ]]; then
            echo "$commit_res"
            echo "(but doing git push anyway)"
            git push
            exit 1
        else
            echo "git commit error:"
            echo "$commit_res"
            exit 1
        fi
    fi
}

cd ~/txts/synced-inbox || exit 1
git pull
voice_recognise
copy_into_target
final_clean

echo "all done"
