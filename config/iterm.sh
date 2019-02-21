set_iterm_name() {
  mode=$1; shift
  echo -ne "\033]$mode;$@\007"
}
iterm_both () { set_iterm_name 0 $@; }
iterm_window () { set_iterm_name 2 $@; }

iterm_win_file=~/.iterm_window_title
iterm_win_num=${TERM_SESSION_ID:1:1}
iterm_tab_num=${TERM_SESSION_ID:3:1}
iterm_pane_num=${TERM_SESSION_ID:5:1}
iterm_win_title=""

function iterm-win() {
  [ -z "$TERM_SESSION_ID" ] && return 1
  if [ -z "$1" ]
  then
    read -p "Title: " iterm_win_title
  else
    iterm_win_title=$1
  fi
  [ -z "$iterm_win_title" ] && iterm_win_title="Term $iterm_win_num"
  [ ! -e "$iterm_win_file" ] && touch "$iterm_win_file"
  gsed -i '/^'$iterm_win_num':.*$/d' $iterm_win_file
  echo "$iterm_win_num: $iterm_win_title" >>$iterm_win_file
}

function iterm-tab() { set_iterm_name 1 $@; }

function iterm_title_update() {
  [ ! -r "$iterm_win_file" ] && iterm-win
  iterm_win_title="$(cat $iterm_win_file | grep "^$iterm_win_num:.*$" 2>/dev/null | cut -d: -f2- | sed $'s/^[ \t]*//;s/[ \t]*$//')"
  if [ -z "$iterm_win_title" ]
  then
    iterm-win
    iterm_window $iterm_win_title
  else
    iterm_window $iterm_win_title
  fi
}

if [ "$iterm_pane_num" = "0" ] && [ "$iterm_tab_num" = "0" ]
then
  iterm-win
fi
iterm_title_update
