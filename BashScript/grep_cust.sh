#!/bin/bash
echo "Try to grep -- $*"

# e.q.
###
#   c,h
#   sh
#   c,h,cpp,hpp
#### NO space!
# SUBFN=c,h

#echo "  -- filename argu: $SUBFN"
INC_FN=$(echo '--include=*.'{c,h,sh})
# INC_FN=$(echo '--include=*.'{c,h})
# INC_FN=$(echo --include=*.c)
# INC_FN=$(echo --include=*vimrc)
echo "  -- filename argu: $INC_FN"

# working format
grep "$*" ./ -RsnI $INC_FN ./ > grep_cust_list 2>/dev/null

# INC_FN='c h'
# REF=INC_FN
#echo "--include=*.${!REF}"

# grep '--include=*.'{$SUBFN}  -Rn -I "$*"  ./ > grep_cust_list 2>/dev/null
# grep '--include=*.'{$SUBFN}  -Rn -I "$*"  ./ > grep_cust_list 2>/dev/null
# grep '--include=*.'{$SUBFN} "$*"  -Rn -I  ./ > grep_cust_list 2>/dev/null



### include sub-filename
# grep '--include=*.'{$SUBFN} "$*"  -Rn -I  ./ > grep_cust_list 2>/dev/null

### exclude some files
# grep  -I  -Rn "$*"  --exclude="\ " ./  > grep_cust_list 2>/dev/null

### only one filename
#echo "  --include=Makefile"
#grep --include=Makefile "$*"  -Rn -I  ./ > grep_cust_list 2>/dev/null
# grep --include=*.$SUBFN "$*"  -Rn -I  ./ > grep_cust_list 2>/dev/null

### The target also are including that filename doesn't include '.'
# grep  "$*"  -Rn -I  ./ > grep_cust_list 2>/dev/null

vi grep_cust_list
