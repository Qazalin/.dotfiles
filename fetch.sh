#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --bin
mkdir -p ~/.vim/undo

[[ $(uname -s) == Darwin ]] && brew install bash riff
