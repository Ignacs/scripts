TRUNK_SVN_URL=http://10.1.1.54:8088/ASP_RTF61XX/branches/merge_ezmesh_220531
FEATURE_SVN_URL=http://10.1.1.54:8088/ASP_RTF61XX/branches/ezmesh
SVN_REV=$1
OUTPUT=svn_diff_output
echo "svn diff $TRUNK_SVN_URL -r $((SVN_REV-1)):$SVN_REV $SVN_URL"
vi -O svn_ci $OUTPUT
# echo "merge -r $((SVN_REV-1)):$SVN_REV $SVN_URL"


