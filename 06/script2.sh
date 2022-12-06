#!/bin/bash
chars=$(grep -o '.')
str_len=$(wc -l <<< $chars)
index=1
while [ $str_len -gt $index ]; do
	len=$(tail -n"+$index" <<< "$chars" | head -n14 | sort -u | wc -l)
	if [ "$len" -eq 14 ]; then
		echo $((index+13))
		break
	fi
	index=$((index+1))
done
