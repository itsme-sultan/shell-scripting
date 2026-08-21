#!/bin/bash

read -p "Enetr any number less than 10." number

while [ $number -ge 0 ]
do
	echo $number
	number=$((number-1))
done

echo "Done!!"
