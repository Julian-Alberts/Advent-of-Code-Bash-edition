#!/bin/bash
sum=0
cat $1 | while read number; do
	if [ "$number" = '' ]; then
		echo $sum
		sum=0
	else
		sum=$((sum + number))
	fi
done
