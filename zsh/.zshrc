export ZSH="$HOME/.oh-my-zsh"

# fzf setup
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh prompt
get_git_branch() {
  git branch 2> /dev/null | sed -n '/^\*/s/^\* //p'
}
hex_to_ansi() {
  if [[ $1 =~ ^#[0-9A-Fa-f]{6}$ ]]; then
    local hex=$1
    local r=$((16#${hex:1:2}))
    local g=$((16#${hex:3:2}))
    local b=$((16#${hex:5:2}))
    printf "\e[38;2;%d;%d;%dm" "$r" "$g" "$b"
  else
    printf "\e[0m"
  fi
}
source ~/.env-configs
local cwd_color="$(hex_to_ansi "$GLOBAL_COLOR")"
local git_color="$(hex_to_ansi "$GLOBAL_COLOR")"
# NOTE: the single quotes ensure that $(get_git_branch) is evaluated on every display
PROMPT='${cwd_color}%1~(${git_color}$(get_git_branch)${cwd_color})%f '

alias dev="npm run dev"
alias vim='nvim'
# TODO: tools should probably just be a constant
alias crypto="python3 /Users/qazal/code/tools/crypto/main.py"
alias c="python3 ~/code/tools/box/main.py"
alias r="./extra/run.sh"
alias ci="./extra/test_ops.sh"
alias s="python3 ~/code/tools/c/sound.py"
alias timestat="python3 /Users/qazal/r/c/stats.py"
alias differ="~/code/tools/differ/target/release/differ"
alias ship="~/utils/ship.sh"

plugins=(git)
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
export PATH="/Users/qazal/.local/bin:$PATH"

# fnm
if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/Users/qazal/Library/Application Support/fnm:$PATH"
    eval "$(fnm env --use-on-cd)"
    eval "`fnm env`"
else
    export PATH="/root/.local/share/fnm:$PATH"
    eval "`fnm env`"
fi


if [[ "$(uname)" == "Darwin" ]]; then
    # Add the Qt directory to the PATH and CMAKE_PREFIX_PATH
    export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$(brew --prefix qt@5)
    export PATH=$PATH:$(brew --prefix qt@5)/bin
    export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
fi

# pnpm
export PNPM_HOME="/Users/qazal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
