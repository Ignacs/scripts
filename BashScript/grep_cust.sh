#!/bin/bash
echo "Try to -- $*"

# e.q.
###
#   c,h
#   sh
#   c,h,cpp,hpp
#### NO space!
# SUBFN=c,h

#echo "  -- filename argu: $SUBFN"
# INC_FN=$(echo '--include=*.'{c,h,sh})
GREP_INC_FN=$(echo '--include=*.'{c,h})
# INC_FN=$(echo --include=*.c)
# INC_FN=$(echo --include=*.h)
# INC_FN=$(echo --include=*vimrc)

RG_INC_FN=$(echo -g '*.c' -g '*.h')
#RG_INC_FN=$(echo -g '*.vim' -g '.vimrc')
#RG_INC_FN='-g *.c' '-g *.h'
# working format
# grep "$*" ./ -RsnI $GREP_INC_FN ./ > grep_cust_list 2>/dev/null

echo "  -- filename argu: $RG_INC_FN"
#rg  --vimgrep $RG_INC_FN "$*" ./ > grep_cust_list 1>/dev/null
# rg  --vimgrep $RG_INC_FN "$*" ./ > grep_cust_list 2>/dev/null

# rg  --vimgrep --type $INC_FN -g ./ > grep_cust_list 2>/dev/null

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

# vi grep_cust_list
# cat grep_cust_list | fzf



# grep --recursive --line-number --binary-files=without-match "time" . | fzf --delimiter=':' -n 2.. --preview-window '+{2}-/2' --preview 'clp -h {2} {1}' --bind 'ctrl-o:execute(vim +{2} {1} < /dev/tty)'
rg  --vimgrep $RG_INC_FN "$*" ./ | fzf --delimiter=':' -n 2.. --preview-window '+{2}-/2' --preview 'clp -h {2} {1}' --bind 'ctrl-o:execute(vim +{2} {1} < /dev/tty)'

echo "--- Dump to grep_cust_list!"
