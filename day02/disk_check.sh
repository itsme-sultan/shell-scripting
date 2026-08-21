#!/bin/bash

#Creating check_disk function

check_disk() {
	echo "===disk usage==="
	df -h / |awk 'NR==2 {print "name:" $1, "size:" $2, "used:" $3, "Available:" $4}'
	echo #blank line
}


#Creating function check_memory

check_memory() {
	echo "======memory usage====="
	free -h | awk 'NR==2 {print "size:" $2, "used:" $3, "available:" $4}'

}

#creating main function

main() {
	check_disk
	check_memory
}

#Calling main function

main


