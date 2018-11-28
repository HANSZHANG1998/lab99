#!/bin/bash

COUNTER=0; 
last = 1;

pin=$( gpio read 5 ); 

	until [ $COUNTER -eq 16 ]
	do
	let "pin=$(gpio read 5)"
	if [ $pin == $last ]; then
		sleep 0.01s
	else
		if [ $pin == 1 ]; then
			let "last=$pin"
		else
			((count++))
			./setbits.sh $count
			echo "button pressed $count times"
			let "last=$pin"
		fi
	fi
		
	done

		if [ $COUNTER -eq 16 ]
		then	
			echo BUZZER
			gpio write 4 1;
			sleep 1s;
			gpio write 4 0; 

		fi		
