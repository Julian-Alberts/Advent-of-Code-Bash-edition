#!/bin/bash
while read line; do
	size=$(echo -n $line | wc -c)
	comp_size=$((size/2))
	comp1=$(echo "${line:0:comp_size}")
	comp2=$(echo "${line:comp_size:comp_size}")
	char=$(echo -e "$comp1\n$comp2" | ./find_dup_char.sh)
	char=$(./char_to_ascii.py $char)
	if [ "$char" -ge "65" -a "$char" -le "90" ]; then
		char=$((char-65+27))
	else
		char=$((char-97+1))
	fi
	sum=$((sum+char))
	echo $sum
done | tail -n 1
