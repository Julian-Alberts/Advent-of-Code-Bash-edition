#!/bin/bash
while read line; do
	for ((i=0; i<${#line}; i++)); do
		echo "${line:i:1}"
	done | sort | uniq
done | sort | uniq -D | uniq
