#!/bin/bash


#Write a shell script that monitors the value of gpio
#pin 5. It should busy wait (continually check and loop) as long as the pin
#is 1 (not pressed). It should then busy wait as long as the pin is 0
#(pressed). The goal here is that this shell should wait until the button is
#pressed and then released

pinVal=$( gpio read 5 ); #here  we read the button and save the value
pressed=1; #not pressed by default
while true
do
		
	if [ $pinVal -eq 1 ] ; #if pin is not pressed, wait until it is pressed,
	then
		until [ $pinVal -eq 0 ] #until the pin value changes, keep looping
		do
			echo $pinVal;
			pressed=0
			export pressed;
			pinVal=$( gpio read 5 )
		done
		
	fi
	
	pinVal=$( gpio read 5 )
	
	if [ $pinVal -eq 0 ] ; #if pin is  pressed, wait until it is not pressed,
	then
		until [ $pinVal -eq 1 ] #until the pin value changes, keep looping
		do
			echo $pinVal;
			pressed=1
			export pressed;			
			pinVal=$( gpio read 5 )
		done
		
	fi
	
done