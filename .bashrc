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
alias up="git pull upstream master --rebase && git push origin master"
alias d="git diff upstream/master..HEAD"
alias dt="difft /tmp/k0 /tmp/k1 --color=always | less -R"

alias v="export VIZ=1"
alias vv="export VIZ=0"
alias ttops="python test/test_tiny.py TestTiny.test_plus"
alias tops="PYTHONPATH=. python -m pytest test/test_ops.py"
alias bn="git push upstream HEAD:update_benchmark -f"
function gd() {
  eval $(open https://github.com/$(git remote get-url upstream | cut -d':' -f2)/compare/master...qazalin:$(git branch --show-current))
}

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

export TERM=xterm-256color
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
stty -ixon
bind -x '"\C-s": "~/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000
export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/sbin:$HOME/.cargo/bin:/sbin:/opt/homebrew/opt/llvm/bin:$PATH"
