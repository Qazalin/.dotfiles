#!/bin/bash

if [ -z "$1" ]; then
    exit 1
fi

FEATURE_BRANCH=$(git rev-parse --abbrev-ref HEAD)
REPO=$(basename $PWD)

if [ "$FEATURE_BRANCH" = "master" ]; then
    echo "branch is master"
    exit 1
fi

git push origin $FEATURE_BRANCH

open "https://github.com/Qazalin/$REPO/compare/master...$FEATURE_BRANCH"
#python3 ./extra/sz.py

while true; do
    read -p "merge $FEATURE_BRANCH into master? " yn
    case $yn in
        [Yy]* ) 
            git checkout master
            git fetch origin master
            git merge origin/master
            git merge --squash $FEATURE_BRANCH
            git commit -m "$1" -m "$(git log $FEATURE_BRANCH --not master --oneline)"
            git push origin master
            git branch -D $FEATURE_BRANCH && git push origin --delete $FEATURE_BRANCH
            break;;
        [Nn]* ) 
            exit;;
        * ) ;;
    esac
done
