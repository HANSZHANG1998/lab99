count=0
pin=$(gpio read 5)
if [ "$count" -eq 0 ]
then ./initMode.sh
fi
while true
do
    pin=$(gpio read 5)
    if [ "$pin" -eq 0 ]
    then
        
        ((count++))
	./waitForButtonPress.sh
	echo "$count"
        ./setbits.sh "$count"
  echo "waiting for button press"
        if [ "$count" -eq 16 ]
        then
            count=0
        fi

        if [ "$count" -eq 0 ]
        then
            gpio write 4 1 
            sleep 1
            gpio write 4 0 
	    echo "Stop"
	    break
        fi
    fi
done
