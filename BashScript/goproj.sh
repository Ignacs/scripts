#!/bin/sh
FILE_LIST="
GPATH
GRTAGS
GSYMS
GTAGS
"

# TOOL=gtags
TOOL=ctags
# for i in $FILE_LIST ;
# do
# 	find . -name $i -print -exec rm {} \;
# done

echo "Tool :" $TOOL


SCOPE_FILE=FILESET.txt
if [ -n "$1" ] ; then
	echo "Create file map : " $SCOPE_FILE
    for i in $@ ; do
        echo "Source code directory : " $i
		echo ""
        # find $i -name "Makefile" -o -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -name "*.m" > $SCOPE_FILE
#        find $i -maxdepth 1  -name "*.h" -o -name "*.c" | xargs chown `whoami`
        find $i -maxdepth 1  -name "*.h" -o -name "*.c"  >> $SCOPE_FILE
    done
else

	# find the git repo"
	START_DIR=$PWD
	dir=$PWD
	# echo "now within $dir"
	GIT_REPO_EXIST=0
	while true
	do
	    dir=$(dirname $PWD)
	    if [ -d $dir/.git ] ; then
	  	  	GIT_REPO_EXIST=1;
	  	  	break;
	    fi
		if [ $dir = / ] ; then
			echo "Reach /";
			break;
		fi
	    cd $dir;
	    # echo "now within $dir"
	done

	if [  "$GIT_REPO_EXIST" = "1" ] ; then
	    echo "GIt repo in $dir";
		PATH_UPDATE=$dir
	else
		cd $START_DIR
		PATH_UPDATE=$START_DIR
	fi

    echo "Source code directory : $PATH_UPDATE"
    echo "Create file map : $PATH_UPDATE"
	echo ""
    # find $PATH_UPDATE -name "Makefile" -o -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -name "*.m" >> $SCOPE_FILE
    #find $PATH_UPDATE -maxdepth 1 -name "*.h" -o -name "*.c"  > $SCOPE_FILE
#    find $PATH_UPDATE  -name "*.h" -o -name "*.c"  | xargs chown `whoami`
    find $PATH_UPDATE  -name "*.h" -o -name "*.c"  > $SCOPE_FILE
fi

# echo "Be sure all of file's owner"
# for i in
# chown rox $i

# rm tags
#ctags -R --verbose --append --c-kinds=+px --c++-kinds=+px --fields=+iamSl --extras=+fq --exclude=.svn,.d,.o,.git
ctags -R  --append --c-kinds=+px --c++-kinds=+px --fields=+iamSl --extras=+fq --exclude=.svn,.d,.o,.git
# gtags-cscope -Rbkq -i $SCOPE_FILE
cscope -Rbkq -i $SCOPE_FILE
gtags -f $SCOPE_FILE
