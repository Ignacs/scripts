#!/bin/bash
# warning /bin/bash != /bin/sh

root_folder=$PWD
GIT_REPOs=$(find . -name ".git" -type d -not -name extern)
GIT_REPO_LIST=$root_folder/git_repo_list
echo "" > $GIT_REPO_LIST
for proj in $GIT_REPOs
do
	cd $proj/../
	echo $PWD >> $GIT_REPO_LIST
	echo "Move to [$PWD], fetch..."
	git fetch .
	cd - >/dev/null
done
echo "Output the repo lists in $GIT_REPO_LIST"

