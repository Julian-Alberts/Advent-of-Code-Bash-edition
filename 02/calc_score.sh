#!/bin/bash
while read opponent my; do
	if [ $my = "R" ]; then
		score=$((1+score))
	else
		if [ $my = "P" ]; then
			score=$((2+score))
		else
			score=$((3+score))
		fi 
	fi
	if [ $my = $opponent ]; then
		score=$((score+3))
	else
		if [ $my = "R" -a $opponent = "S" -o $my = "S" -a $opponent = "P" -o $my = "P" -a $opponent = "R" ]; then
			score=$((score+6))
		fi
	fi
	echo $score
done | tail -n 1
