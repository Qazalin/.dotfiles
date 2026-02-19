#!/usr/bin/env bash

for f in .bashrc .vimrc .tmux.conf .gitconfig tmux-sessionfinder.sh tmux-sessionizer.sh; do
  ln -s "$(pwd)/$f" "$HOME/$f"
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --bin
mkdir -p ~/.vim/undo

[[ $(uname -s) == Darwin ]] && brew install bash vim riff

vim -es -u "$HOME/.vimrc" +'PlugInstall --sync' +qa </dev/null >/dev/null 2>&1

[[ $(uname -s) == Linux && $(uname -m) == x86_64 ]] && curl -fsSL https://github.com/walles/riff/releases/download/3.6.1/riff-3.6.1-x86_64-linux | install -m 0755 /dev/stdin "$HOME/.local/bin/riff"
