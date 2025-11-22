alias g="git add . && git status -v"
alias b="git branch"
alias gg="git add . && git status -v | riff"
alias gm="git checkout master"
alias ghr="git fetch upstream master && git reset --hard upstream/master"
alias sghr="git read-tree --reset -u upstream/master"
alias gmr="git fetch upstream master && git merge upstream/master --no-edit"
alias gmc="git merge --continue"
alias grc="git rebase --continue"
alias gr="git rebase -i HEAD~2"
alias gs="git status"
alias gp="git push origin HEAD"
alias gpp="git push origin HEAD --force"
alias gca="git commit --amend"
alias gcae="git commit --amend --no-edit"
alias bd="git branch | rg -v 'master' | xargs git branch -D"
alias up="git pull upstream master --rebase"
alias d="git diff upstream/master..HEAD | riff"
alias dt="riff /tmp/k0 /tmp/k1"
alias iso="printf '%s ' \"\$(date +'%Y-%m-%dT%H:%M:%S%z' | sed -E 's/([0-9]{2})([0-9]{2})$/\1:\2/')\" | pbcopy"
function gd() {
  eval $(open https://github.com/$(git remote get-url upstream | cut -d':' -f2)/compare/master...qazalin:$(git branch --show-current))
}

alias ttops="python test/test_tiny.py TestTiny.test_plus"
alias bn="git push upstream HEAD:update_benchmark -f"
alias lint="python -m ruff check --extend-exclude t.py --extend-exclude ref.py --preview && python -m mypy ./tinygrad"

PS1='$(if [[ $? == 0 ]]; then echo "\w"; else echo "\[\e[31m\]\w\[\e[0m\]"; fi)$(git branch 2>/dev/null | grep \* | sed "s/* / (/" | sed "s/$/) /")> '

export TERM=tmux-256color
export COLORTERM=truecolor
stty -ixon
bind -x '"\C-s": "~/tmux-sessionizer.sh"'
bind -x '"\C-f": "~/tmux-sessionfinder.sh"'
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND='history -a; history -n; '"$PROMPT_COMMAND"
export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/sbin:$HOME/.cargo/bin:/sbin:/opt/homebrew/opt/llvm@21/bin:/usr/lib/llvm/bin/:$HOME/.fzf/bin:$HOME/code/kernel/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

fzf_search_history() {
  local found
  found=$(cat $HISTFILE | awk '{sub(/^[[:space:]]*[0-9]+[[:space:]]*/,""); gsub(/^[[:space:]]+|[[:space:]]+$/,""); gsub(/[[:space:]]+/," "); lines[++n]=$0} END {for(i=n;i>=1;i--) if(!seen[lines[i]]++) print lines[i]}' | fzf -e +s --height 20%)
  if [[ -n $found ]]; then
    READLINE_LINE=$found
    READLINE_POINT=0x7fffffff
  fi
}
bind -x '"\C-r": fzf_search_history'
bind -m vi-command -x '"\C-r": fzf_search_history'
bind -m vi-insert -x '"\C-r": fzf_search_history'
