#!/bin/bash
for arg in "$@"
do
  export "$arg"
done
last_command=$(tail -n 2 ~/.zsh_history | head -n 1 | sed 's/.*;//')
echo $last_command
eval $last_command
