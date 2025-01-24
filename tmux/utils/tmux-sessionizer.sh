#!/bin/bash

session=$(find ~/code -mindepth 1 -maxdepth 1 -type d | fzf)
session_name=$(basename "$session")

if ! tmux has-session -t "$session_name" 2> /dev/null; then
    tmux new-session -s "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name"
