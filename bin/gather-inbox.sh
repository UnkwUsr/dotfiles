#!/bin/bash
set -euo pipefail
shopt -s nullglob

cd ~/txts/synced-inbox || exit 1
git pull

TARGET_TO="$HOME/txts/dtm/plans.md"
# temporary backups for now, just in case
cp "$TARGET_TO" /tmp/plans-"$(date +%s)".md


voice_recognise() {
    if [ -d voices ]; then
        cd voices
        ls -1 ./*.m4a | xargs -I{} ffmpeg -hide_banner -i {} -ar 16000 {}.wav
        cd -
        my-whisper.py voices voices-res.md
    fi
}

copy_into_target() {
    for d in ./inbox_*.md ; do
        echo -e "\n## from $d" >> "$TARGET_TO"
        echo "$d"
        cat <(echo) "$d" >> "$TARGET_TO"
    done

    [ -f voices-res.md ] && cat <(echo -e "\n## voices\n") voices-res.md >> "$TARGET_TO"

    fd . -HI -tf --exclude=voices-res.md --exclude=voices/ --exclude='inbox_*.md' --exclude=buy.md --exclude=.git/ \
        | ifne cat <(echo -e "\n## WARNING: other files also\n") - >> "$TARGET_TO"
}

final_clean() {
    [ -f voices-res.md ] && rm voices-res.md
    [ -d voices ] && (git rm voices/*.m4a && mkdir -p ~/txts/dtm/voices && mv voices/*.wav ~/txts/dtm/voices && rmdir voices)
    files=( ./inbox_*.md ) && (( ${#files[@]} )) && git rm "${files[@]}"

    # also add buy.md at the same time. Why not
    git add buy.md

    git commit -m "gather auto at $(date)"
    git push
}

voice_recognise
copy_into_target
final_clean

echo "all done"
