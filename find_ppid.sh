#!/bin/sh
TARGET_PID=$1
echo "find parent of $TARGET_PID"
echo `ps -ef | awk '$2 ~ /\<'$TARGET_PID'\>/ { print $3; }'`

