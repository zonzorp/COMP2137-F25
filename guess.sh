#!/bin/bash

secretnumber=$(($RANDOM % 10 +1))
while read -p "Give me a number from 1 to 10: " userguess; do
	if [ -z "$userguess" ]; then
		echo "You didn't give me something."
		echo "I guess you don't want to play."
		break
	elif [[ "$userguess" ! ~= "^[0-9][0-9]*$" ]]; then
		echo "That's not a number, dummy"
		exit 2
	elif [ $userguess -lt $secretnumber ]; then
		echo "Too low, guess higher."
		continue
	elif [ $userguess -gt $secretnumber ]; then
		echo "Too high, guess lower."
		continue
	else
		echo "You win!"
		exit
	fi
done
cat <<EOF
Better luck next time.
EOF
