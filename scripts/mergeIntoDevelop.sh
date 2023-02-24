#!/bin/bash
USER_BRANCH=$(git status | grep "On branch" | sed 's/On branch '// )

git checkout develop
git merge $USER_BRANCH

git push origin develop
git checkout $USER_BRANCH
git push origin $USER_BRANCH

