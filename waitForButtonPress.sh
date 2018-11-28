#!/bin/bash

pin = ( gpio read 5 ); 
press = 1;
while 1
do
		
	if [ $pin -eq 1 ] ; 
	then
		until [ $pin -eq 0 ]
		do
			echo $pin;
			press=0
			export press;
			pin=$( gpio read 5 )
		done
		
	fi
	
	pin=$( gpio read 5 )
	
	if [ $pin -eq 0 ] ; 
	then

		until [ $pin -eq 1 ] 
		do
			echo $pin;
			press=1
			export press;			
			pin=$( gpio read 5 )
		done
		
	fi
	
done
