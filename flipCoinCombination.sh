#!/bin/bash -x
#!/bin/bash -x
coin_1=$(($RANDOM%2))
if [ $coin_1 -eq 1 ]
then
	echo "HEADS"
else
	echo "TAILS"
fi

