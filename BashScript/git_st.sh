#!/bin/bash
# warning /bin/bash != /bin/sh

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

	git st -s > git_basic_st
	FNUM=`wc -l < git_basic_st`
	echo "total : " $FNUM
	# the outer () is declared as array
	# the inter () with dollar-sign is the result of command
	# the sed command use ':' as delimiter , and it will remove the sign '.'
	F_ST=($( git st --porcelain=v2 . | cut -d ' ' -f 2 | sed 's:\.::' ))  # files status
#	F_ST=$( git st --porcelain=v2 . | cut -d ' ' -f 2  )  # files status

	F_PATH=($(git st --porcelain=v2 . | cut -d ' ' -f 9 ))  # files path name

 	# for idx in {1..$FNUM}
	for (( idx=1 ; idx <= $FNUM ; idx++ ))
	do
# 		echo -n "$idx " >> $root_folder/git_st
 		echo -n "${F_ST[$idx]} " >> $root_folder/git_st
 		echo "$RELATIVE_PATH/${F_PATH[$idx]}" >> $root_folder/git_st
 	done
	cd - >/dev/null

done

vi git_st

