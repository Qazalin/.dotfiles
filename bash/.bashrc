alias cl="clear"
alias vim="nvim"
alias python3="python3.12"
alias c="python3 ~/code/box/main.py"
alias sz="python3 ./extra/sz.py"
alias ship="~/utils/ship.sh"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d3="export DEBUG=3"
alias d4="export NOOPT=1 && export DEBUG=4"
alias d5="export NOOPT=1 && export DEBUG=5"
alias opt="export NOOPT=0"
alias n="vim $HOME/.notes"
alias m="cat ~/.map | less"
alias lint="python3 -m ruff check --extend-exclude t.py --extend-exclude ref.py --preview && python3 -m mypy ./tinygrad --strict-equality && python3 -m pylint ./tinygrad"
alias b="git branch"
alias bn="git push origin HEAD:update_benchmark -f"
alias up="git pull origin master --rebase"
alias d="git diff master..HEAD"
alias f1="feat f1"
alias gbc="git branch --show-current | tr -d '\n' | pbcopy"
alias gr="git rebase -i HEAD~2"
alias gca="git commit --amend"
alias gcae="git commit --amend --no-edit"
alias gp="git push origin HEAD"
alias gpp="git push origin HEAD --force"
alias gm="git checkout master"
alias gms="git stash && git checkout master"
alias gl="git log"
alias ghr="git fetch origin master && git reset --hard origin/master"
alias ghrr="git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)"
alias gmr="git fetch origin master && git merge origin/master --no-edit"
alias gmc="git merge --continue"
alias grc="git rebase --continue"
alias bd="git branch | rg -v 'master' | xargs git branch -D"
alias dt="differ diff /tmp/k0 /tmp/k1 | less -R"
alias dtt="difft /tmp/k0 /tmp/k1"
alias prv="gh pr view --web"
alias tops="PYTHONPATH=. python3 -m pytest test/test_ops.py"
alias tsops="PYTHONPATH=. python3 -m pytest test/test_schedule.py"
alias ttops="python3 test/test_tiny.py TestTiny.test_plus"
alias taops="python3 -m pytest test/test_assign.py"
alias sf1="git stash && f1"
alias sm="git stash && git checkout master"
alias t="python3 t.py"

export TERM=xterm-256color
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/node@20/bin:$HOME/.cargo/bin:/opt/homebrew/bin/python3.10:$HOME/Library/Python/3.9/bin/:$HOME/nvim-macos-arm64/bin:$PATH
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
    git add ./tinygrad/ && git add ./test && git add ./.github && git add ./extra && git add ./docs && git add ./examples && git add viz/ && git status -v
  else
    git add . && git status -v
  fi
}
function r() {
  eval /Users/qazal/code/remu/extra/run.sh
  # cargo build --release
}
function gd() {
    open https://github.com/tinygrad/tinygrad/compare/master...$(git branch --show-current)
}

function start_ssh_agent() {
  ssh-add -l # shows nothing
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  # shows stuff
  ssh-add -l
}

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

stty -ixon
bind -x '"\C-s": "~/utils/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/utils/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
