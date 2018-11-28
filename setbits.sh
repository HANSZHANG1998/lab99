#!/bin/bash
if [ ! $1 ];then
	echo "no input"
	exit 1
fi

for i in {0..3}
do
	gpio write $i $(($1 >> $i & 1))
done
