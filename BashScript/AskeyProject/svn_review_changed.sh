target_file=$2
REV=$1
if [ $# -eq 2 ]; then
	svn_diff_w_rev.sh -r  $REV -a $((REV-1)) $target_file
elif [ $# -eq 1 ]; then
	FILE_LIST=`svn diff -r  $REV:$((REV-1)) --summarize | awk '{print $2}'`
	echo "Compare files:"
	for i in $FILE_LIST
	do
		echo "\t$i"
		svn_diff_w_rev.sh -r  $REV -a $((REV-1)) $i
	done
fi
