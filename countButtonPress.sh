#!/bin/bash

COUNTER=0; #counter increments every time button is pressed

pinVal=$( gpio read 5 ); #here  we read the button and save the value

	until [ $COUNTER -eq 16 ]
	do
		#sleep .5s;
		pinVal=$( gpio read 5 ); #here  we read the button and save the value
		sleep .1s;

		if [ $pinVal -eq 0 ]
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
			gpio write 4 1; #here  buzzer goes ON
			sleep 1s;
			gpio write 4 0; #here  buzzer goes off

		fi		
