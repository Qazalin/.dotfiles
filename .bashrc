alias g="git add . && git status -v"
alias gg="git add . && git status -v | riff"
alias gm="git checkout master"
alias ghr="git fetch upstream master && git reset --hard upstream/master"
alias gmr="git fetch upstream master && git merge upstream/master --no-edit"
alias gmc="git merge --continue"
alias grc="git rebase --continue"
alias gr="git rebase -i HEAD~2"
alias gs="git status"
alias gl="git log"
alias gp="git push origin HEAD"
alias gpp="git push origin HEAD --force"
alias gca="git commit --amend"
alias gcae="git commit --amend --no-edit"
alias b="git branch"
alias bd="git branch | rg -v 'master' | xargs git branch -D"
alias up="git pull upstream master --rebase"
alias d="git diff upstream/master..HEAD"
alias dt="riff /tmp/k0 /tmp/k1"
function gd() {
  eval $(open https://github.com/$(git remote get-url upstream | cut -d':' -f2)/compare/master...qazalin:$(git branch --show-current))
}
alias c="clear"

function gb() {
  git fetch origin
  b=$(git branch -r | grep -v 'origin/HEAD' | sed -n 's|^ *origin/||p' | sort -u | fzf)
  [ -n "$b" ] && git checkout "$b"
}

alias ttops="python test/test_tiny.py TestTiny.test_plus"
alias tops="PYTHONPATH=. python -m pytest -n=auto test/test_ops.py"
alias vtops="PYTHONPATH=. python -m pytest -v test/test_ops.py"
alias ci="python3 -m pytest -n=auto test/"
alias bn="git push upstream HEAD:update_benchmark -f"
alias lint="python -m ruff check --extend-exclude t.py --extend-exclude ref.py --preview && python -m mypy ./tinygrad --strict-equality && python -m pylint ./tinygrad"
export WANDB_MODE=disabled

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

export TERM=xterm-256color
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
stty -ixon
bind -x '"\C-s": "~/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000
export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/sbin:$HOME/.cargo/bin:/sbin:/opt/homebrew/opt/llvm/bin:/usr/lib/llvm-19/bin/:/opt/homebrew/opt/python@3.13/libexec/bin:/opt/homebrew/opt/llvm@19/bin:$PATH"
