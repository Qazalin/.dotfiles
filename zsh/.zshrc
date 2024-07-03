alias cl="clear"
alias dev="npm run dev"
alias vim="$HOME/nvim-macos-arm64/bin/nvim"
alias c="python3 ~/code/box/main.py"
alias sz="python3 ./extra/sz.py"
alias ship="~/utils/ship.sh"
alias d="git diff master..HEAD"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d4="export NOOPT=1 && export DEBUG=4"
alias opt="export NOOPT=0"
alias b="git branch"
alias s="~/utils/tmux-sessionizer.sh"
alias gr="git rebase -i HEAD~2"
alias gca="git commit --amend"
alias n="vim $HOME/.notes"
alias lint="python3 -m ruff check . --preview && python3 -m mypy ./tinygrad --strict-equality && python3 -m pylint ./tinygrad"

export PYTHONPATH="."
export TERM=xterm-256color
export PATH="/Users/qazal/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

#if [[ "$(uname)" == "Darwin" ]]; then
# Add the Qt directory to the PATH and CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$(brew --prefix qt@5)
export PATH=$PATH:$(brew --prefix qt@5)/bin
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
#fi

function g() {
  if [[ $PWD =~ 'tinygrad$' ]]; then
    git add ./tinygrad/ && git add ./test && git add ./.github && git add ./extra && git status -v
  else
    git add . && git status -v
  fi
}
function r() {
  eval /Users/qazal/code/egg/extra/run.sh
}
alias g=g
alias r=r

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi
PROMPT='%~> '
