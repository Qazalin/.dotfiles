# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# git clone https://github.com/guesswhozzz/021011.zsh-theme ~/021011-tools 
# mv ~/021011-tools/021011.zsh-theme $ZSH/themes/021011.zsh-theme
ZSH_THEME=021011

hre() {
    npx hardhat $1 $2 $3 $4 $5
}

black() {
    python3 -m black $1
}

hre-script() {
    npx hardhat run scripts/$1
}

alias dev="npm run dev"
alias vim='nvim'
# alias thirdwave="/Users/qazal/work/thirdWave/thirdwave-cli/bin/thirdwave-cli"
alias c="python3 /Users/qazal/r/c/main.py"
alias mxutil='~/tmux-utils/window-killer.sh'
alias snowsql='~/Applications/SnowSQL.app/Contents/MacOS/snowsql'
alias timestat="python3 /Users/qazal/r/c/stats.py"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:/Users/qazal/.foundry/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM=xterm-256color


export PATH="/Users/qazal/.local/bin:$PATH"

# fnm
export PATH="/Users/qazal/Library/Application Support/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#
# __conda_setup="$('/Users/qazal/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/qazal/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/qazal/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/qazal/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<



# ROS stuff
echo "export OPENSSL_ROOT_DIR=$(brew --prefix openssl)" >> ~/.zshrc

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
# pnpm endexport OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3

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
