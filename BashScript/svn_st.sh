#!/bin/sh
# output svn status and generate compare script
OUTPUT_FILE=svn_st
CMP_FILE=svn_cmp

if [ $# -gt 1 ] ; then 
	echo ""
	echo "    Usage: svn_st.sh <path or file>"
	exit 
fi 

if [ $# -gt 0 ] ; then 
	test -e $1 && echo "User specified path: [$1]" || echo "[$1] not exists, use [./]"
	if [ -d $1 ] ; then 
		# folder
		echo "Is a folder."
		DST=$1/$OUTPUT_FILE
		svn st $1 | grep -v \? > $DST
		cp $DST $1/$CMP_FILE
		CMP_EXEC=$1/$CMP_FILE
	else
		# file
		echo "Is a file."
		DST=$OUTPUT_FILE
		svn st $1 | grep -v \? > $DST
		cp $DST $CMP_FILE
		CMP_EXEC=$CMP_FILE
	fi
else
	DST=$OUTPUT_FILE
    svn st  | grep -v \? > $DST
	cp $DST $CMP_FILE
	CMP_EXEC=$CMP_FILE
fi 

echo "Output to [$DST]"
echo "Output cmp list to [$CMP_EXEC]"

sed -i 's/A  /# A /' $CMP_EXEC
sed -i 's/!  /# ! /' $CMP_EXEC
sed -i 's/D  /# D /' $CMP_EXEC
sed -i 's/R  /# R /' $CMP_EXEC
sed -i 's/\~  /# \~ /' $CMP_EXEC
sed -i 's/M  /svn_diff.sh /' $CMP_EXEC
sed -i 's/RM /svn_diff.sh /' $CMP_EXEC
sed -i 's/C  /svn_diff.sh /' $CMP_EXEC
chmod +x $CMP_EXEC

echo "==============================="
echo "Total [`cat $CMP_EXEC | grep -o "svn_diff.sh" | wc -l`] files needs to compare."
echo "Total [`cat $CMP_EXEC | grep -o "# A " | wc -l`] files needs to add"
echo "Total [`cat $CMP_EXEC | grep -o "# D " | wc -l`] files needs to remove"

