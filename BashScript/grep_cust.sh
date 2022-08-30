grep --include=\*.{c,h,cpp,hpp,js,html,mak,mk,py} --include=Makefile -Rn "$*"  ./  > grep_cust_list
vi grep_cust_list


