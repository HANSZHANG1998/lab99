#!/bin/bash

#COUNTER=0

#while [ $COUNTER -lt 4 ] # while the counter is less than 4

pins='0 1 2 3 4' #for loop takes a list of items
for pins in $pins #for each of the items in the list do the following
do
		#echo $COUNTER # do this
		gpio mode $pins out; #here  we set it to out
		gpio write $pins 0; #here  0 is the value we set it to
		
		
		#((COUNTER++)) # increment counter
done


pins2='5' #for loop takes a list of items, this is the BUTTON
for pins2 in $pins2 #for each of the items in the list do the following
do
		#echo $COUNTER # do this
		gpio mode $pins2 in; #here  we set it to in
		gpio mode $pins2 up; #pull up		
		gpio read $pins2 ; #here  we read the button
		
		#((COUNTER++)) # increment counter
done

#echo "All done"
#echo "pins set to output and initalized to value 0 (off)"
