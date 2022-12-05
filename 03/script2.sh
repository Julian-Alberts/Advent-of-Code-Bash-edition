#!/bin/bash
xargs -n3 | while read elf1 elf2 elf3; do
	char=$(echo -e "$(echo -e "$elf1\n$elf2" | ./find_dup_char.sh | xargs | sed 's/ //g')\n$elf3" | ./find_dup_char.sh)
	char=$(./char_to_ascii.py $char)
	if [ "$char" -ge "65" -a "$char" -le "90" ]; then
		char=$((char-65+27))
	else
		char=$((char-97+1))
	fi
	sum=$((sum+char))
	echo $sum
done | tail -n 1

