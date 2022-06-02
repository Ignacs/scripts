#!/bin/sh
echo $#
if [ $# -gt 1 ] ; then 
    wpath=$2
    echo "asdfasdf"
    svn cat $1 > $2/tmp.rhead
    vimdiff $1 $2/tmp.rhead
else
    echo "same"
    svn cat $1 > $1.rhead
    vimdiff $1 $1.rhead
fi 

