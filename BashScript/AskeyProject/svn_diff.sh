#!/bin/sh
# echo $#
if [ $# -gt 1 ] ; then
    wpath=$2
    svn cat $1 > $2/tmp.rhead
	if [ -n "$(cmp $2/tmp.rhead $1)" ]; then
		vimdiff $2/tmp.rhead $1
		echo " Different : $2/tmp.rhead $1"
	else
		echo " Same : $2/tmp.rhead $1"
	fi
else
    svn cat $1 > $1.rhead
	if [ -n "$(cmp $1.rhead $1)" ]; then
		vimdiff $1.rhead $1
		echo " Different : $1.rhead $1"
	else
		echo " Same : $1.rhead $1"
	fi
fi

