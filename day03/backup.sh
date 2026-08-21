#!/bin/bash

source_dir=$1  #/home/ubuntu/data
backup_dir=$2 #/home/ubuntu/backups
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)

if [ $# -eq 0 ]; then
	echo "Usage: ./backup.sh <source_dir> <backup_dir>"
	fi


fun_backup() {
	tar -czf ${backup_dir}/backup_${time_stamp}.tar.gz $source_dir  2>/dev/null

	if [ $? -eq 0 ]; then

		du -h /home/sultan/backups/*.gz
		echo "Backup completed"
	else
		echo "backup failed!!!!!"
		exit 1
	fi
}




fun_rotate(){
	echo "deleting old backups....."
	find $backup_dir -type f -name *.gz -mmin +1 -delete -print

	if [ $? -eq 0 ]; then
		echo "Backup deleted!!"
	else
		echo "Failed to delete!!!!"
		exit 1
	fi
}

fun_backup

fun_rotate
