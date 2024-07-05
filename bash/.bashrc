alias cl="clear"
alias dev="npm run dev"
alias vim="$HOME/nvim-macos-arm64/bin/nvim"
alias c="python3 ~/code/box/main.py"
alias sz="python3 ./extra/sz.py"
alias ship="~/utils/ship.sh"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d4="export NOOPT=1 && export DEBUG=4"
alias opt="export NOOPT=0"
alias n="vim $HOME/.notes"
alias lint="python3 -m ruff check . --preview && python3 -m mypy ./tinygrad --strict-equality && python3 -m pylint ./tinygrad"
alias b="git branch"
alias d="git diff master..HEAD"
alias gr="git rebase -i HEAD~2"
alias gca="git commit --amend"
alias gp="git push origin HEAD --force"
alias m="git checkout master"
alias bd="git branch | rg -v 'master' | xargs git branch -D"

export PYTHONPATH="."
export TERM=xterm-256color
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/node@20/bin:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#if [[ "$(uname)" == "Darwin" ]]; then
# Add the Qt directory to the PATH and CMAKE_PREFIX_PATH
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$(brew --prefix qt@5)
# export PATH=$PATH:$(brew --prefix qt@5)/bin
# export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
# eval "$(/opt/homebrew/bin/brew shellenv)"
# export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
#fi

function g() {
  if [[ "$PWD" == *"/tinygrad"* ]]; then
    git add ./tinygrad/ && git add ./test && git add ./.github && git add ./extra && git status -v
  else
    git add . && git status -v
  fi
}
function r() {
  eval /Users/qazal/code/remu/extra/run.sh
}
PS1='\w> '

stty -ixon
bind -x '"\C-s": "~/utils/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/utils/tmux-sessionfinder.sh"'
