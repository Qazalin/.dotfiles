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
rgb_to_ansi() {
  if [[ $1 -ge 0 ]] && [[ $1 -le 255 ]] && [[ $2 -ge 0 ]] && [[ $2 -le 255 ]] && [[ $3 -ge 0 ]] && [[ $3 -le 255 ]]; then
    printf "\e[38;2;%d;%d;%dm" $1 $2 $3
  else
    printf "\e[0m"
  fi
}
local cwd_color="$(rgb_to_ansi 187 154 247)"
local git_color="$(rgb_to_ansi 203 185 159)"

# Setting the prompt
# NOTE: the single quotes ensure that $(get_git_branch) is evaluated on every display
PROMPT='${cwd_color}%1~%f(${git_color}$(get_git_branch)%f) '

alias dev="npm run dev"
alias vim='nvim'
# TODO: tools should probably just be a constant
alias crypto="python3 /Users/qazal/code/tools/crypto/main.py"
alias c="python3 ~/code/tools/c/main.py"
alias r="./run.sh"
alias timestat="python3 /Users/qazal/r/c/stats.py"
alias differ="~/code/tools/differ/target/release/differ"
alias ship="~/utils/ship.sh"
alias sound="python3 ~/code/tools/c/sound.py"
alias lights="python3 ~/code/tools/c/lights.py"

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
