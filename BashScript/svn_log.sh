#!/bin/sh
REV=4080
DST=.

echo "Show log from $REV to head"
if [ $# -gt 0 ] ; then
	DST=$1
	svn up $DST
	svn log -r $REV:head $DST --stop-on-copy > svn_log
else
	svn up .
	#svn log --stop-on-copy -v  $DST> svn-log
	svn log -v -r $REV:head $DST --stop-on-copy > svn_log
fi

vi svn_log
