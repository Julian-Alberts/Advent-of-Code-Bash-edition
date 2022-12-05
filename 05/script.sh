#!/bin/bash
mkdir tmp
num_line=$(grep -En '^ [0-9]' $1 | cut -d':' -f1)
cols=$(head -n$num_line $1 | tail -n 1 | sed 's/^ ([0-9])/\\1/' | sed 's/  //g')
head -n$num_line $1 | head -n -1 | sed 's/^   /[0]/' | sed -E 's/ ( {3})/ [0]/g' | sed 's/ /,/g' | sed -E 's/(]|\[|0)//g' > tmp/init_state
tail -n+$num_line $1 | tail -n+3 > tmp/instructions
for col in $cols; do
	cut -d',' -f$col tmp/init_state | grep -v '^$' > "tmp/stack_$col"
	tac "tmp/stack_$col" > "tmp/stack_cp"
	mv "tmp/stack_cp" "tmp/stack_$col" 
done
# Init done

cut -d' ' -f2,4,6 tmp/instructions | while read n from to; do
	tail -n$n "tmp/stack_$from" > "tmp/tmp_stack"
	tac "tmp/tmp_stack" >> "tmp/stack_$to"
	head -n-$n "tmp/stack_$from" > "tmp/tmp_stack"
	mv "tmp/tmp_stack" "tmp/stack_$from"
done
for col in $cols; do
	tail -n1 "tmp/stack_$col" 
done | xargs | sed 's/ //g'
rm -rf tmp
