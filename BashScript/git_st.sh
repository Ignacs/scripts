#!/bin/sh

root_folder=$PWD
rm $root_folder/git_st 2>/dev/null

echo "# ?? = Untracked " > $root_folder/git_st
echo "# A = Added " >> $root_folder/git_st
echo "# M = modified " >> $root_folder/git_st
echo "# D = deleted" >> $root_folder/git_st
echo "# R = renamed" >> $root_folder/git_st
echo "# C = copied" >> $root_folder/git_st
echo "# U = updated but unmerged" >> $root_folder/git_st

GIT_REPOs=$(find . -name .git -type d)
for proj in $GIT_REPOs
do
	cd $proj/../
	echo "========================================================================" >> $root_folder/git_st
	echo "Move to [$PWD]" >> $root_folder/git_st

	RELATIVE_PATH=$(realpath -m --relative-to=$root_folder .)

	# the outer () is declared as array
	# the inter () with dollar-sign is the result of command
	F_ST=($(git st -s . | cut -d ' ' -f 2))  # files status
	F_PATH=($(git st -s . | cut -d ' ' -f 3))  # files path name

	for idx in ${!F_ST[@]};
	do
	#	echo -n "$idx " >> $root_folder/git_st
		echo -n "${F_ST[$idx]} " >> $root_folder/git_st
		echo "$RELATIVE_PATH/${F_PATH[$idx]}" >> $root_folder/git_st
	done
	cd - >/dev/null

done

vi git_st

