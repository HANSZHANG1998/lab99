#!/bin/bash

count=0
last=1

while((1))
do
	let "now=$(gpio read 5)"
	if [ $now == $last ]; then
		sleep 0.01s
	else
		if [ $now == 1 ]; then
			let "last=$now"
		else
			((count++))
			./setbits.sh $count
			echo "button pressed $count times"
			let "last=$now"
		fi
	fi
	
	if [ $count == 16 ]; then
		gpio write 4 1
		echo "number too big"
		sleep 1s
		gpio write 4 0
		count=0
		echo "reset number to 0"
	fi
done

