#!/bin/bash

USERBRANCH=$(git status | grep "On branch" | sed 's/On branch '// )

git checkout develop
git pull
git checkout $USERBRANCH
git merge develop

git push origin $USERBRANCH

