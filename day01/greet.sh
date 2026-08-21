#!/bin/bash



if [ $# -eq 0 ]; then
	echo "usage: ./greet.sh <name>"
else
	echo "Hello, $1!"
fi
