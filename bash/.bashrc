alias cl="clear"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d3="export DEBUG=3"
alias d4="export NOOPT=1 && export DEBUG=4"
alias d5="export NOOPT=1 && export DEBUG=5"
alias opt="export NOOPT=0"
alias lint="python -m ruff check --extend-exclude t.py --extend-exclude ref.py --preview && python -m mypy ./tinygrad --strict-equality && python -m pylint ./tinygrad"
alias b="git branch"
alias bn="git push origin HEAD:update_benchmark -f"
alias up="git pull origin master --rebase"
alias d="git diff master..HEAD"
alias gbc="git branch --show-current | tr -d '\n' | pbcopy"
alias gr="git rebase -i HEAD~2"
alias gca="git commit --amend"
alias gcae="git commit --amend --no-edit"
alias gp="git push origin HEAD"
alias gpp="git push origin HEAD --force"
alias gm="git checkout master"
alias gms="git stash && git checkout master"
alias ghr="git fetch origin master && git reset --hard origin/master"
alias ghrr="git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)"
alias gmr="git fetch origin master && git merge origin/master --no-edit"
alias gmc="git merge --continue"
alias grc="git rebase --continue"
alias bd="git branch | rg -v 'master' | xargs git branch -D"
alias dt="difft /tmp/k0 /tmp/k1 --color=always | less -R"
alias prv="gh pr view --web"
alias tops="PYTHONPATH=. python -m pytest test/test_ops.py"
alias ttops="python test/test_tiny.py TestTiny.test_plus"
alias sm="git stash && git checkout master"
alias t="python t.py"
alias gd="open https://github.com/tinygrad/tinygrad/compare/master...$(git branch --show-current)"
alias g="git add . ':!t.py' && git status -v"
alias v="export VIZ=1"
alias vv="export VIZ=0"

export TERM=xterm-256color
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

stty -ixon
bind -x '"\C-s": "~/utils/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/utils/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
