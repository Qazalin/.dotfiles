alias cl="clear"
alias vim="nvim"
alias sz="python3 ./extra/sz.py"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d3="export DEBUG=3"
alias d4="export NOOPT=1 && export DEBUG=4"
alias d5="export NOOPT=1 && export DEBUG=5"
alias opt="export NOOPT=0"
alias n="vim $HOME/.notes"
alias ship="$HOME/utils/ship.sh"
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
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/node@20/bin:$HOME/.cargo/bin:/opt/homebrew/bin/python3.10:$HOME/Library/Python/3.9/bin/:$HOME/nvim-macos-arm64/bin:$HOME/nvim-linux64/bin:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias g="git add ./tinygrad/ && git add ./test && git add ./.github && git add ./extra && git add ./docs && git add ./examples && git status -v"
function gd() {
  open https://github.com/tinygrad/tinygrad/compare/master...$(git branch --show-current)
}

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

stty -ixon
bind -x '"\C-s": "~/utils/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/utils/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000
# path?
alias python3="python3.11"
alias pip3="python3.11 -m pip"
alias pip="python3.11 -m pip"
alias python="python3.11"
alias v="export VIZ=1"
alias vv="export VIZ=0"
