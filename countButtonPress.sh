#!/bin/bash

COUNTER=0; 

pinValue=$( gpio read 5 ); 

	until [ $COUNTER -eq 16 ]
	do
		pinValue=$( gpio read 5 ); 
		sleep .1s;

		if [ $pinValue -eq 0 ]
		then
			./initMode.sh			
			((COUNTER++));
			sleep .1s;			
			echo number is $COUNTER
			./setbits.sh $COUNTER;
		fi
		
	done

		if [ $COUNTER -eq 16 ]
		then	
			echo BUZZER
			gpio write 4 1;
			sleep 1s;
			gpio write 4 0; 

		fi		
