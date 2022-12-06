#!/bin/bash
chars=$(grep -o '.')
str_len=$(wc -l <<< $chars)
index=1
while [ $str_len -gt $index ]; do
	len=$(tail -n"+$index" <<< "$chars" | head -n4 | sort -u | wc -l)
	if [ "$len" -eq 4 ]; then
		echo $((index+3))
		break
	fi
	index=$((index+1))
done
