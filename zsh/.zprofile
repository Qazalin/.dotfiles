eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# tmux utils
bindkey -s ^s "~/utils/tmux-sessionizer.sh\n"
bindkey -s ^f "~/utils/tmux-sessionfinder.sh\n"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

export PATH="/Users/qazal/.local/share/solana/install/active_release/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/brew shellenv)"
