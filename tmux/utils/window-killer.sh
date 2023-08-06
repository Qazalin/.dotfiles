#!/bin/bash

# Set the input array
input_array=("$@")

# Loop through each item in the input array
for i in "${input_array[@]}"
do
    # if i is "kill", ignore
    if [ "$i" == "kill" ]; then
        continue
    fi
    # if i is "all", kill all windows
    if [ "$i" == "all" ]; then
        tmux kill-window -a
        continue
    fi
    # if i is a number, kill that window
    if [[ "$i" =~ ^[0-9]+$ ]]; then
        tmux kill-window -t "$i"
        continue
    fi
done

