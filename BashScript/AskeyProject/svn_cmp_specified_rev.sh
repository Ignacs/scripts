SVN_URL=http://10.1.1.54:8088/ASP_RTF61XX/branches/ezmesh
SVN_REV=$1
SVN_TARGET=$2

if [ $# -eq 2 ]; then
	echo "2 Args,  Compare with $SVN_URL/$2@$1"
	# svn cat -r $1 $SVN_URL/$2 > $2.r$1
	# echo "$2 <=> $2.rhead"
	vimdiff $2 $2.rhead
elif [ $# -eq 1 ]; then
	echo "1 artgs,  Compare with $SVN_URL/$1"
	# svn cat $SVN_URL/$1 > $1.rhead
# 	echo "$1 <=> $1.rhead"
	vimdiff $1 $1.rhead
else
	echo "0 Args,  exit"
fi

