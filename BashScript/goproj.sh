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
        # sudo find $i -name "Makefile" -o -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -name "*.m" > $SCOPE_FILE
        find $i -maxdepth 1  -name "*.h" -o -name "*.c" | xargs sudo chown `whoami`
        find $i -maxdepth 1  -name "*.h" -o -name "*.c"  >> $SCOPE_FILE
    done
else
    echo "Source code directory : $PWD"
    echo "Create file map : $PWD"
	echo ""
    # sudo find $PWD -name "Makefile" -o -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -name "*.m" >> $SCOPE_FILE
    #find $PWD -maxdepth 1 -name "*.h" -o -name "*.c"  > $SCOPE_FILE
    find $PWD  -name "*.h" -o -name "*.c"  | xargs sudo  chown `whoami`
    find $PWD  -name "*.h" -o -name "*.c"  > $SCOPE_FILE
fi

# echo "Be sure all of file's owner"
# for i in
# sudo chown ignacs $i

# gtags-cscope -Rbkq -i $SCOPE_FILE
cscope -Rbkq -i $SCOPE_FILE
# rm tags
ctags -R --extras=f --exclude=.svn,.d,.o
gtags -f $SCOPE_FILE
