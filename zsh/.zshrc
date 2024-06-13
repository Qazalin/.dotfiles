# prompt comes first
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PYTHONPATH="."
alias cl="clear"
alias dev="pnpm run dev"
alias vim='nvim'
alias c="python3 ~/code/tools/box/main.py"
alias sz="python3 ./extra/sz.py"
alias s="python3 ~/code/tools/box/sound.py"
alias differ="~/code/tools/differ/target/release/differ"
alias ship="~/utils/ship.sh"
alias d="git diff master..HEAD"
alias d0="export DEBUG=0 && export NOOPT=0"
alias d2="export DEBUG=2"
alias d4="export NOOPT=1 && export DEBUG=4"
alias opt="export NOOPT=0"
alias lint="python3 -m ruff . --preview && python3 -m mypy ./tinygrad && python3 -m pylint ./tinygrad"

export TERM=xterm-256color
export PATH="/Users/qazal/.local/bin:$PATH"

# fnm
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/Users/qazal/Library/Application Support/fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
  eval "`fnm env`"
else
  export PATH="/root/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

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
    git add ./tinygrad/ && git add ./test && git add ./.github && git status -v
  else
    git add . && git status -v
  fi
}

function r() {
  eval ~/code/tinygrad/remu/extra/run.sh
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit snippet OMZP::git
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload  -U compinit && compinit
zinit cdreplay -q
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
bindkey '^w' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# history, https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

alias g=g
alias r=r
alias s="~/utils/tmux-sessionizer.sh"
