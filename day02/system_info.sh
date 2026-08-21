#!/bin/bash

set -euo pipefail

fun_hostname() {
	echo "Host name =======: $(hostname)."
	echo #blank line
}


fun_uptime() {
	echo "===Uptime======== "
	uptime
	echo

}

fun_disk() {
	echo "===top 5 disk usage==="
	echo
	sudo du -sh /* 2>/dev/null | sort -rh | head -5 || true
	echo
}

fun_mem() {
	echo "=========Memmory usage========="
	free -h | awk 'NR==2 {print "Size: " $2, "Used: " $3, "Available: " $4 }'
	echo
}

fun_cpu() {
	echo "Printing top 5 CPU consuming proccess."
	ps aux --sort=-%cpu | head -6
	echo
}

main() {
	fun_hostname
	fun_uptime
	fun_disk
	fun_mem
	fun_cpu
}

main


