#!/bin/bash


log_dir=$1

if [ $# -eq 0 ]; then
	echo "usage ./log_rotate <log_directory>"
	exit 1
fi


compress=$(find $log_dir -type f -name *.log -mmin +1 -exec gzip {} \; -print | wc -l)
if [ $? -eq 0 ]; then
	echo "compressing the file!!"
else
	exit 1
fi

rotation=$(find $log_dir -type f -name *.gz -mmin +1 -delete -print | wc -l)

if [ $? -eq 0 ]; then
	echo "Deleting the file!!'"
else
	exit 1
fi


echo "Total $compress file compressed."
echo
echo "Total $rotation file deleted."
