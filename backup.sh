#!/bin/bash

<<task

script is used for to take backup of data folder

task

if [ $# -eq 0 ]; then
	echo "Usage: ./backup.sh <enter source folder> <enter destination folder>"
fi

time_stamp=$(date '+%Y-%m-%d-%H-%M-%S')
source=$1  #/home/sultan/dat
backup_dir=$2  #/home/sultan/backups

fun_backup() {
	zip -r  "$backup_dir/backup_$time_stamp.zip" $source >/dev/null   #backup the file
	if [ $? -eq 0 ]; then
		echo "Backup generated successfully!!"
	fi

}


fun_rotation() {
	backups=($(ls -t "${backup_dir}/backup_"*.zip))  #Created arrays of all the backuo file.
		if [ ${#backups[@]} -gt 5 ]; then
			echo "Proforming rotations for 5 days."
		fi

		for bckp in ${backups[@]:5}; do  #keep only 5 latest backup
			rm -f $bckp
		done
		echo "Rotation completed!!!!"

}

#Automate the proccess using cronetab * * * * * bash /home/sultan/backups.sh  --ever minute


fun_backup
fun_rotation
