SVN_URL=http://10.1.1.54:8088/ASP_RTF61XX/branches/ezmesh
SVN_REV=$1
OUTPUT=svn_merge_output
svn up
svn merge  --non-interactive -r $((SVN_REV-1)):$SVN_REV $SVN_URL > $OUTPUT
# svn merge --dry-run --non-interactive -r $((SVN_REV-1)):$SVN_REV $SVN_URL > $OUTPUT
# echo "svn merge --dry-run --non-interactive -r $((SVN_REV-1)):$SVN_REV $SVN_URL"
vi -O svn_ci $OUTPUT
# echo "merge -r $((SVN_REV-1)):$SVN_REV $SVN_URL"


