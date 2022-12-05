#!/bin/bash
sed 's/[^0-9]/ /g' | while read min1 max1 min2 max2; do
	if [ "$min1" -le "$min2" -a "$max1" -ge "$max2" ]; then
		sum=$((sum+1))	
	else
		if [ "$min2" -le "$min1" -a "$max2" -ge "$max1" ]; then
			sum=$((sum+1))	
		fi
	fi
	echo $sum
done | tail -n 1
