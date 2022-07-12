OUTPUT=find_output
find ./ -name $1 > $OUTPUT
vi $OUTPUT
