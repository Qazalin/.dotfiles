alias g="git add . && git status -v"
alias gm="git checkout master"
alias ghr="git fetch upstream master && git reset --hard upstream/master"
alias gmr="git fetch upstream master && git merge upstream/master --no-edit"
alias gmc="git merge --continue"
alias grc="git rebase --continue"
alias gr="git rebase -i HEAD~2"
alias gp="git push origin HEAD"
alias gpp="git push origin HEAD --force"
alias gbc="git branch --show-current | tr -d '\n' | pbcopy"
alias gca="git commit --amend"
alias gcae="git commit --amend --no-edit"
alias b="git branch"
alias bd="git branch | rg -v 'master' | xargs git branch -D"
alias up="git pull upstream master --rebase"
alias d="git diff upstream/master..HEAD"
alias dt="difft /tmp/k0 /tmp/k1 --color=always | less -R"
alias prv="gh pr view --web"

alias v="export VIZ=1"
alias vv="export VIZ=0"
alias tops="PYTHONPATH=. python -m pytest test/test_ops.py"
alias ttops="python test/test_tiny.py TestTiny.test_plus"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d3="export DEBUG=3"
alias d4="export NOOPT=1 && export DEBUG=4"
alias d5="export NOOPT=1 && export DEBUG=5"
alias opt="export NOOPT=0"
alias lint="python -m ruff check --extend-exclude t.py --extend-exclude ref.py --preview && python -m mypy ./tinygrad --strict-equality && python -m pylint ./tinygrad"
alias bn="git push upstream HEAD:update_benchmark -f"
function gd() {
  eval $(open https://github.com/tinygrad/tinygrad/compare/master...$(git branch --show-current))
}

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

export TERM=xterm-256color
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
stty -ixon
bind -x '"\C-s": "~/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/sbin
