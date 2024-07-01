export PYTHONPATH="."
alias cl="clear"
alias dev="npm run dev"
alias vim='$HOME/nvim-macos-arm64/bin/nvim'
alias c="python3 ~/code/box/main.py"
alias sz="python3 ./extra/sz.py"
alias s="python3 ~/code/box/sound.py"
alias differ="~/code/tools/differ/target/release/differ"
alias ship="~/utils/ship.sh"
alias d="git diff master..HEAD"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d4="export NOOPT=1 && export DEBUG=4"
alias opt="export NOOPT=0"
alias lint="python3 -m ruff check . --preview && python3 -m mypy ./tinygrad --strict-equality && python3 -m pylint ./tinygrad && check_dangerous_dtype_is"
alias b="git branch"
alias gr="git rebase -i HEAD~2"
alias gca="git commit --amend"
alias n="vim $HOME/.notes"
alias ci="$HOME/code/ci/target/release/ci"

export TERM=xterm-256color
export PATH="/Users/qazal/.local/bin:$PATH"

# fnm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# TODO: remove the noise
check_dangerous_dtype_is() {
  local directory="tinygrad"
  local patterns=("dtypes.* is " "dtype is ")
  local file_extension=".py"
  find "$directory" -name "*$file_extension" | while read -r file; do
    for pattern in "${patterns[@]}"; do
      if rg "$pattern" "$file" | grep -vqE 'is\s+None|is\s+not\s+None'; then
        rg "$pattern" "$file" | grep -vE 'is\s+None|is\s+not\s+None'
      fi
    done
  done
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

alias g=g
alias r=r
alias s="~/utils/tmux-sessionizer.sh"
PROMPT='%~> '
