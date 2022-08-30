#!/bin/sh

TMP_OPTIND=$OPTIND
OPTIND=1

function usage()
{
    echo " !! Usage: $1 <-s F/B> <-r Redmine number> <-t Redmine title> <-m commit_message file> <-l commit list>"
	echo ""
}
if [ $# -lt 6 ]; then
	echo "At least one  argument (-s) for status, one argument (-r) for Redmine number and one argument (-t) for Redmine title"
	usage
	exit 0;
fi
while getopts "s:t:r:m:l:" flag
do
    case $flag in
        m)
            echo "$flag"
            IND=$OPTIND
            CI_MESG="$OPTARG"
            if [ -z $CI_MESG ] ; then
                echo "without ci message"
                exit -1
            fi
            ;;
        l)

            echo "$flag"
            IND=$OPTIND
            CI_LIST="$OPTARG"
            if [ -z $CI_LIST ] ; then
                echo "without ci list"
                exit -1
            fi
            ;;
		s)
			ST="$OPTARG"
			if [ 'F' != $ST -a 'B' != $ST ] ; then
				usage
				exit 0;
			fi
			echo status="$ST"
			;;
		t)
			RMTITLE="$OPTARG"
			echo "$RMTITLE"
			;;
		r)
			RMN="$OPTARG"
			echo "Commit for $RMN"
			echo "http://10.1.1.54/redmine/issues/$RMN"
			;;
        *)
            echo "Error occurs!"
            usage $0
            exit -1
            ;;

    esac
    echo
done

# Amy 2018/07/18 : SVN format
# F/B#(RM ID)-(RM title)
if [ ! -f "$CI_MESG" ] ; then
    echo "Use default file: svn_commit.txt"
	CI_MESG=svn_commit.txt
	CI_MESG_WRITING=svn_commit_writing.txt

	# if default message not exist
    if [ ! -f "$CI_MESG" ] || [ -z "$CI_MESG" ] ; then
       	echo $ST#$RMN-$RMTITLE > $CI_MESG_WRITING
	else # exist
		sed -e "1c$ST#$RMN-$RMTITLE" $CI_MESG > $CI_MESG_WRITING
	fi
	cp $CI_MESG_WRITING $CI_MESG
else
    echo "Use file $CI_MESG"
	# Replace format force

    if [ -z "$CI_MESG" ] ; then
       	echo $ST#$RMN-$RMTITLE > $CI_MESG_WRITING
	else
		sed -e "1c$ST#"$RMN"-"$RMTITLE $CI_MESG > svn_commit.txt
	fi
	CI_MESG=svn_commit.txt
fi

if [ ! -f "$CI_LIST" ] ; then
    echo "Use default file 'svn_ci'"
    CI_LIST="svn_ci"
else
    echo "Use commit list: $CI_LIST"
fi

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
vi -O "$CI_LIST" $CI_MESG

svn up `cat $CI_LIST`

echo "Commit detail:"
echo "===================================================================="
echo "Message:"
cat $CI_MESG
echo "===================================================================="
echo Files:
if [ -s "$CI_LIST" ] ; then
    cat "$CI_LIST"
else
    echo "no file to commit"
    exit
fi
echo "===================================================================="
echo -n "Commit?[y/n] "
read TEST_CASE
if [ "y" = "$TEST_CASE" ] ; then
    echo "..."
    svn ci -F $CI_MESG `cat $CI_LIST`
else
    echo "User cancel."
fi
