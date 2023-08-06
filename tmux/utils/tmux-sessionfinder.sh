# !#/bin/env bash #why do you say no such file

args=()

session=$(tmux list-sessions | fzf)
IFS=":"

read -ra ADDR <<< "$session"
for i in "${ADDR[@]}"; do   
    args+=("$i")
done

session_tag="${args[0]}"

tmux switch-client -t "$session_tag"

IFS=' '     # reset to default value after usage
