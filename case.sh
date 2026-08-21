#!/bin/bash


<<Task
testing if-else statement with string comparision


Task
echo "Select the option"

read select

case $select in
	a)echo "$(date)";;
	b) echo "Learning linux.";;
	c) pwd;;
	*)echo "wrong selection";;
esac

name="sulTan"

echo "${name^^}"
echo "${name,,}"
