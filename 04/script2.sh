#!/bin/bash
sed 's/[^0-9]/ /g' | while read min1 max1 min2 max2; do
	if [ "$min1" -le "$max2" -a "$max1" -ge "$min2" ]; then
		sum=$((sum+1))	
	else
		if [ "$min2" -le "$max1" -a "$max2" -ge "$min1" ]; then
			sum=$((sum+1))	
		fi
	fi
	echo $sum
done | tail -n 1
