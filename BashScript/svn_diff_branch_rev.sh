
#!/bin/bash
#TEMP=`getopt -o rb:c:: --long a-long,b-long:,c-long:: \
#     -n 'example.bash' -- "$@"`
TEMP=`getopt -o a:r: --long a-long:r-long::`
# /usr/share/doc/util-linux/examples/getopt-parse.bash
TOTAL_ARGN=$#
if [ $TOTAL_ARGN -lt 3 ] ; then
    echo "Too few arguments : $#" ;
    echo "arg : -r <x> [-a <x>] [-h]" ;
    exit 1 ;
fi

# Note the quotes around `$TEMP': they are essential!
# eval set -- "$TEMP"

HEAD_CMP="0";
while true ; do
#    echo $1
	case "$1" in
		-b|-branch)
			BRANCH=$2;
			echo "compare with branch \`$2'" ; shift 2 ;;
		-a|--a-long)
            ANO_REV=$2;
            echo "another: \`$2'" ; shift 2;;
		-h|--h-long)
			HEAD_CMP="1";
            echo "compare with head:" ; shift ;;
		-r|--r-long)
            REV=$2;
            echo "rev: \`$2'" ; shift 2 ;;
#		-c|--c-long)
#			# c has an optional argument. As we are in quoted mode,
#			# an empty parameter will be generated if its optional
#			# argument is not found.
#			case "$2" in
#				"") echo "Option c, no argument"; shift 2 ;;
#				*)  echo "Option c, argument \`$2'" ; shift 2 ;;
#			esac ;;
		--) shift ; break ;;
		*)
            FILE=$1
            break;
	esac
done
#echo "Remaining arguments:"
#for arg do echo '--> '"\`$arg'" ; done

# echo argv: $TOTAL_ARGN
if [  $TOTAL_ARGN -lt 7 ] ; then
    svn cat -r $REV $FILE > $FILE.r$REV;

	if [ "1" -eq "$HEAD_CMP" ]  ; then
		echo "Compare with Head, r$REV"
		svn cat $BRANCH/$FILE > $FILE.rHead;
		vimdiff  $FILE.r$REV $FILE.rHead;
	else
		vimdiff  $FILE.r$REV $FILE;
	fi
    rm -f $FILE.r$REV $FILE.rHead;
else
    echo "Compare with r$ANO_REV, r$REV"
    svn cat -r $BRANCH/$ANO_REV $FILE > $FILE.r$ANO_REV;
    svn cat -r $BRANCH/$REV $FILE > $FILE.r$REV

    vimdiff $FILE.r$ANO_REV $FILE.r$REV
    rm -f  $FILE.r$ANO_REV $FILE.r$REV
fi
