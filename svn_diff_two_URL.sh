TRUNK_SVN_URL=http://10.1.1.54:8088/ASP_RTF61XX/branches/merge_ezmesh_220531
FEATURE_SVN_URL=http://10.1.1.54:8088/ASP_RTF61XX/branches/ezmesh
SVN_REV=$1
OUTPUT=svn_diff_output
if [ $# -lt 2 ] ; then
	echo "Without Rev and file name! "
	exit
fi
echo "svn diff $TRUNK_SVN_URL/$2  $FEATURE_SVN_URL/$2@$1"
# echo "merge -r $((SVN_REV-1)):$SVN_REV $SVN_URL"


