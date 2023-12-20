export ZSH="$HOME/.oh-my-zsh"

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# git clone https://github.com/guesswhozzz/021011.zsh-theme ~/021011-tools 
# mv ~/021011-tools/021011.zsh-theme $ZSH/themes/021011.zsh-theme
ZSH_THEME=021011

alias dev="npm run dev"
alias vim='nvim'
alias c="python3 ~/code/tools/c/main.py"
alias timestat="python3 /Users/qazal/r/c/stats.py"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM=xterm-256color

export PATH="/Users/qazal/.local/bin:$PATH"

# fnm
export PATH="/Users/qazal/Library/Application Support/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# Add the Qt directory to the PATH and CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$(brew --prefix qt@5)
export PATH=$PATH:$(brew --prefix qt@5)/bin
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3

# pnpm
export PNPM_HOME="/Users/qazal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# fnm
export PATH="/Users/qazal/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

alias run() {
    case "$1" in
        METAL)  VAR=METAL ;;
        LLVM)   VAR=LLVM ;;
        GPU)    VAR=GPU ;;
        CPU)    VAR=CPU ;;
        TORCH)  VAR=TORCH ;;
        *)      echo "invalid arg"; return 1 ;;
    esac
    local last_cmd=$(fc -ln -1)
    local pure_cmd=$(echo $last_cmd | sed 's/^[^ ]* //') # no env vars
    $VAR=1 $pure_cmd
}
