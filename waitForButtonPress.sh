until [ $(gpio read 5) -eq 0 ]
do
	echo "button not pressed"
	sleep 2
done

 until [ $(gpio read 5) -eq 1 ]
  do
        echo "button pressed"
	sleep 2		
 done
