#!/bin/bash

GIT=`which git`
CURRENT_DIRECTORY=`pwd`

for DIR in `ls`
do
    if [[ -f $DIR ]]; then
        # if is file skip
        continue
    fi
    # go to folder
    cd $DIR

    # check if there is .git folder inside this folder
    if [[ -d '.git' ]]; then
        # get output of git status command
        OUT=$($GIT status)

        # check if there is any modified file in git directory
	if [[ -n `echo $OUT | grep 'modified\|Untracked'` ]]; then
            echo "-> $DIR"
        fi
    fi
    # go back to main folder
    cd $CURRENT_DIRECTORY
done
