#!/bin/bash

# If We will trying set clipboard content from new terminal emulator
# instance there will be losted on terminal instance close (in our case,
# after script done). So in script that running in terminal emulator I
# store greenclip selection to file and then get it from THIS script
CLASS_NAME=greenclip_fzf_picker
TMP_FILE_STORE="/tmp/just_tmp_file_to_store_selection_from_greenclip"

termite --class=$CLASS_NAME -e "bash -c \"greenclip print | \
    sed '/^$/d' | fzf -e --border > $TMP_FILE_STORE\"" 2> /dev/null

echo $(cat $TMP_FILE_STORE) | xargs -r -d'\n' -I '{}' greenclip print '{}'
rm $TMP_FILE_STORE
