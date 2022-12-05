#!/bin/bash
./sum.sh $2 | sort -n | tail -n $1 | while read num; do
	sum=$((num+sum))
	echo $sum
done | tail -n 1
