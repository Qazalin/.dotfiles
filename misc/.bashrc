get_git_branch() {
  git branch 2> /dev/null | sed -n '/^\*/s/^\* //p'
}
hex_to_ansi() {
  if [[ $1 =~ ^#[0-9A-Fa-f]{6}$ ]]; then
    hex=$1
    r=$((16#${hex:1:2}))
    g=$((16#${hex:3:2}))
    b=$((16#${hex:5:2}))
    printf "\e[38;2;%d;%d;%dm" "$r" "$g" "$b"
  else
    printf "\e[0m"
  fi
}
GLOBAL_COLOR="#bb9af7"
cwd_color=$(hex_to_ansi "$GLOBAL_COLOR")
git_color=$(hex_to_ansi "$GLOBAL_COLOR")
PS1="\[\$(hex_to_ansi \"$GLOBAL_COLOR\")\]\w\[\$(hex_to_ansi \"$GLOBAL_COLOR\")\](\$(get_git_branch))\[\e[0m\] "
