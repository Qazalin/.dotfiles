if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
fi
bindkey -s ^f "~/utils/tmux-sessionfinder.sh\n"
