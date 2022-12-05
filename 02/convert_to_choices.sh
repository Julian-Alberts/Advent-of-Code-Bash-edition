#!/bin/bash
while read opponent goal; do
	if [ $goal = "D" ]; then
		my=$opponent
	else
		if [ $goal = "W" ]; then
			if [ $opponent = "S" ]; then
				my="R"
			else 
				if [ $opponent = "R" ]; then
					my="P"
				else
					my="S"
				fi
			fi
		else
			if [ $opponent = "S" ]; then
				my="P"
			else 
				if [ $opponent = "R" ]; then
					my="S"
				else
					my="R"
				fi
			fi
		fi
	fi
	echo "$opponent $my"
done
