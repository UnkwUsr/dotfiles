# vim: ft=i3config
#
# my binds for fast translating

# default options for `trans` (translate-shell)
set $trans_put_history cat /tmp/trans_text >> ~/.local/share/trans_history
set $trans_run $trans_put_history && trans -i /tmp/trans_text -view -show-original=no \
    -show-translation-phonetics=yes -show-prompt-message=no \
    -show-languages=no -show-alternatives=yes -show-original-dictionary=yes

# input with dmenu
# to repeat last translate just leave dmenu prompt empty and press enter
set $trans_get_dmenu_input (set -o pipefail && \
    inp=$(echo -n | wmenu -p "trans:" | head -c -1) && \
    (test -z "$inp" || echo "$inp" > /tmp/trans_text))
# input with xprompt which supports IME (for Japanese)
set $trans_get_ime_input (set -o pipefail && \
    inp=$(xprompt < /dev/null) && \
    (test -z "$inp" || echo "$inp" > /tmp/trans_text))
# take text from X11's "primary selection"
set $trans_get_primary wl-paste -p | tr '\n' ' ' > /tmp/trans_text

# translate text taken from dmenu
bindsym $mod+t exec $trans_get_dmenu_input && $st_win_with '$trans_run :ru'
bindsym $mod+shift+t exec $trans_get_dmenu_input && $st_win_with '$trans_run ru:en'
bindsym $mod+shift+f exec $trans_get_dmenu_input && $st_win_with '$trans_run ru:uk'
bindsym $mod+shift+g exec $trans_get_dmenu_input && $st_win_with '$trans_run :ja'
# from japanese to english (input with IME support)
bindsym $mod+g exec $trans_get_ime_input && $st_win_with '$trans_run ja:en'

# translate text from "primary selection" (you just select some text with mouse
# cursor and press this binds)
bindsym $mod+ctrl+t exec $trans_get_primary && $st_win_with '$trans_run :ru'
bindsym $mod+ctrl+shift+t exec $trans_get_primary && $st_win_with '$trans_run :en'
bindsym $mod+ctrl+f exec $trans_get_primary && $st_win_with '$trans_run :uk'
bindsym $mod+ctrl+g exec $trans_get_primary && $st_win_with '$trans_run :ja'

# edit previous translated text with vim
bindsym $mod+$alt+t exec $st_win_with 'vim +set\ shortmess+=I +set\ binary +set\ noeol +set\ spell /tmp/trans_text'
