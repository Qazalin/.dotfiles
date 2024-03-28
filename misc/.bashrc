get_git_branch() {
  git branch 2> /dev/null | grep '^*' | sed 's/^* //'
}
hex_to_ansi() {
  if [[ $1 =~ ^#[0-9A-Fa-f]{6}$ ]]; then
    local hex=$1
    local r=$((16#${hex:1:2}))
    local g=$((16#${hex:3:2}))
    local b=$((16#${hex:5:2}))
    printf "\[\e[38;2;%d;%d;%dm\]" "$r" "$g" "$b"
  else
    printf "\[\e[0m\]"
  fi
}
export GLOBAL_COLOR="#76B900"
export PYTHONPATH="."
cwd_color=$(hex_to_ansi "$GLOBAL_COLOR")
git_color=$(hex_to_ansi "$GLOBAL_COLOR")
PS1="${cwd_color}\$(basename \$(pwd))(${git_color}\$(get_git_branch)${cwd_color})\[\e[0m\] $ "
