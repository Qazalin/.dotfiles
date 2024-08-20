#!/bin/bash

if [ -z "$1" ]; then
    exit 1
fi

FEATURE_BRANCH=$(git rev-parse --abbrev-ref HEAD)
REPO=$(basename $PWD)
MASTER=$(git branch | rg -o 'main|master')

if [ "$FEATURE_BRANCH" = "$MASTER" ]; then
    echo "branch is $MASTER"
    exit 1
fi

git push origin $FEATURE_BRANCH

open "https://github.com/Qazalin/$REPO/compare/$MASTER...$FEATURE_BRANCH"
#python3 ./extra/sz.py

while true; do
    read -p "merge $FEATURE_BRANCH into $MASTER? " yn
    case $yn in
        [Yy]* ) 
            git checkout $MASTER
            git fetch origin $MASTER
            git merge origin/$MASTER
            git merge --squash $FEATURE_BRANCH
            git commit -m "$1" -m "$(git log $FEATURE_BRANCH --not $MASTER --oneline)"
            git push origin $MASTER
            git branch -D $FEATURE_BRANCH && git push origin --delete $FEATURE_BRANCH
            break;;
        [Nn]* ) 
            exit;;
        * ) ;;
    esac
done
